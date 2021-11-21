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
        VStack {
            HStack(alignment: .bottom) {
                Text("reps:")
                    .font(.title)
                    .offset(y: -10)
                Spacer()
                Text("\(rep) / \(maxRep)")
                    .fontWeight(.heavy)
                    .font(.system(size: 60))
            }
            HStack(alignment: .bottom) {
                Text("pause:")
                    .font(.title)
                    .offset(y: -10)
                Spacer()
                Text("\(pause)")
                    .fontWeight(.heavy)
                    .font(.system(size: 60))
            }
            HStack(alignment: .bottom) {
                Text("time:")
                    .font(.title)
                    .offset(y: -30)
                Spacer()
                Text("\(time)")
                    .fontWeight(.heavy)
                    .font(.system(size: 140))
            }
        }
    }
}
