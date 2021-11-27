//
//  TimerDetailView.swift
//  FitnessTimer
//
//  Created by Michael Gemsa on 21.11.21.
//

import SwiftUI

struct TimerDetailView: View {
    
    @Binding var time: Int
    @Binding var pause: Int
    @Binding var rep: Int
    @Binding var maxRep: Int
    
    var body: some View {
        VStack (alignment:.trailing) {
            HStack(alignment: .bottom) {
                Text("reps:")
                    .font(.title3)
                    .offset(y: -10)
                Spacer()
                Text("\(rep) / \(maxRep)")
                                .fontWeight(.heavy)
                                .font(.system(size: 60))
            }
            HStack(alignment: .bottom) {
                Text("pause:")
                    .font(.title3)
                    .offset(y: -10)
                Spacer()
                Text("\(pause.SecondsToTime())")
                    .fontWeight(.heavy)
                    .font(.system(size: 60))
            }
            HStack(alignment: .bottom) {
                Text("time:")
                    .font(.title3)
                    .offset(y: -10)
                Spacer()
                Text("\(time.SecondsToTime())")
                    .fontWeight(.heavy)
                    .font(.system(size: 60))
            }
        }
    }
}
