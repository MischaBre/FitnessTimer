//
//  ContentView.swift
//  FitnessTimer
//
//  Created by Michael Gemsa on 20.11.21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var timerManager = TimerManager()
    
    @State private var timer_rep: Double = 1
    @State private var timer_time: Double = 5
    @State private var timer_break: Double = 1
    
    var body: some View {
        VStack (alignment: .center) {
            Text(".FitnessTimer")
                .font(.system(size: 45))
                .fontWeight(.heavy)
            VStack (alignment: .trailing){
                Slider(value: $timer_rep, in: 1...20)
                Text("\(String(Int(timer_rep))) Wiederholungen")
            
                Slider(value: $timer_time, in: 5...600)
                Text("\(String(Int(timer_time))) Sek Timer")
            
                Slider(value: $timer_break, in: 1...300)
                Text("\(String(Int(timer_break))) Sek Pause")
            }
            
            Button(action: {
                timerManager.startTimer(sec: Int(timer_time), pau: Int(timer_break), rep: 1, maxRep: Int(timer_rep))
            }) {
                RoundedRectangle(cornerRadius: 8)
                    .frame(height: 20)
                    .overlay(Text("Los!")
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.heavy))
                    .foregroundColor(Color.accentColor)
                    .padding()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.accentColor)
            .cornerRadius(16)
            .sheet(isPresented: $timerManager.timerActive) {
                TimerView().environmentObject(timerManager)
            }
        }
        .padding()
    }
}

struct TimerView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var timerManager: TimerManager

    var body: some View {
        VStack {
            TimerDetailView(time: $timerManager.duration, pause: $timerManager.pause, rep: $timerManager.repetitions, maxRep: $timerManager.maxRepititions)
            //Text("\(timerManager.repetitions) x \(timerManager.duration) : \(timerManager.pause)")
            Button(action: {
                timerManager.stopTimer()
                //dismiss()
            }) {
                RoundedRectangle(cornerRadius: 8)
                    .frame(height: 20)
                    .overlay(Text("Stop!")
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.heavy))
                    .foregroundColor(Color.accentColor)
                    .padding()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.accentColor)
            .cornerRadius(16)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
