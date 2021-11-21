//
//  ContentView.swift
//  FitnessTimer
//
//  Created by Michael Gemsa on 20.11.21.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @ObservedObject var timerManager = TimerManager()
    
    @State private var timer_rep: Double = 0.0
    @State private var timer_time: Double = 0.0
    @State private var timer_break: Double = 0.0
    @State private var show_timer: Bool = false
    
    var body: some View {
        VStack (alignment: .center) {
            VStack (alignment: .trailing){
                Slider(value: $timer_rep)
                Text("\(String(Int(20*timer_rep))) Wiederholungen")
            
                Slider(value: $timer_time)
                Text("\(String(Int(600*timer_time))) Sek Timer")
            
                Slider(value: $timer_break)
                Text("\(String(Int(30*timer_break))) Sek Pause")
            }
            
            Button(action: {
                show_timer.toggle()
                timerManager.startTimer(sec: 2, pau: 1, rep: 3)
            }) {
                RoundedRectangle(cornerRadius: 8)
                    .frame(height: 10)
                    .overlay(Text("Go!").foregroundColor(.white))
                    .foregroundColor(Color.accentColor)
                    .padding()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            
            .background(Color.accentColor)
            .cornerRadius(16)
            .sheet(isPresented: $show_timer) {
                TimerView().environmentObject(timerManager)
            }
        }.padding()
    }
}

struct TimerView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var timerManager: TimerManager

    var body: some View {
        VStack {
            Text("\(timerManager.repetitions) x \(timerManager.duration) : \(timerManager.pause)")
            Button(action: {
                timerManager.stopTimer()
                dismiss()
            }) {
                Text("Stop")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
