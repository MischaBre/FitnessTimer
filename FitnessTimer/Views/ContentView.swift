//
//  ContentView.swift
//  FitnessTimer
//
//  Created by Michael Gemsa on 20.11.21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var timerManager = TimerManager()
    
    
    @State private var timerRep: Double = 1
    @State private var timerMaxRep: Double = 30
    @State private var timerTime: Double = 5
    @State private var timerMaxTime: Double = 60
    @State private var timerPause: Double = 1
    @State private var timerMaxPause: Double = 30
    
    var body: some View {
        VStack (alignment: .center) {
            Text(".FitnessTimer")
                .font(.system(size: 45))
                .fontWeight(.heavy)
            VStack (alignment: .trailing){
                SliderButtonView(sliderVar: $timerRep, buttonVar: $timerMaxRep, buttonState: 1)
                HStack {
                    Spacer()
                    Text("\(Int(timerRep)) reps")
                        .font(.title)
                }
                SliderButtonView(sliderVar: $timerTime, buttonVar: $timerMaxTime, buttonState: 3)
                HStack {
                    Spacer()
                    Text("\(Int(timerTime).SecondsToTime()) time")
                        .font(.title)
                }
                SliderButtonView(sliderVar: $timerPause, buttonVar: $timerMaxPause, buttonState: 2)
                HStack {
                    Spacer()
                    Text("\(Int(timerPause).SecondsToTime()) pause")
                        .font(.title)
                }
            }
            
            Button(action: {
                timerManager.startTimer(sec: Int(timerTime), pau: Int(timerPause), rep: 1, maxRep: Int(timerRep))
                UIApplication.shared.isIdleTimerDisabled.toggle()
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
                TimerView()
                    .environmentObject(timerManager)
                    .onDisappear {
                        timerManager.stopTimer()
                    }
            }
        }
        .padding()
    }
    
    
}

extension Int {
    func SecondsToTime() -> String {
        return String(format: "%02i:%02i", self/60, self%60)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
