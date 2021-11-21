//
//  TimerView.swift
//  FitnessTimer
//
//  Created by Michael Gemsa on 21.11.21.
//

import SwiftUI
import AVFoundation

struct TimerView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var timerManager: TimerManager
    
    var body: some View {
        
        VStack {
            TimerDetailView(time: $timerManager.duration, pause: $timerManager.pause, rep: $timerManager.repetitions, maxRep: $timerManager.maxRepititions)
            Button(action: {
                timerManager.stopTimer()
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

