//
//  SliderButtonView.swift
//  FitnessTimer
//
//  Created by Michael Gemsa on 27.11.21.
//

import SwiftUI

struct SliderButtonView: View {
    @Binding var sliderVar: Double
    @Binding var buttonVar: Double
    @State var buttonState: Int
    var body: some View {
        let rangeSteps: [Double] = [5,10,30,60,300,600,1800,3600]
        HStack {
            Button( action: {
                if buttonState > 1 {
                    buttonState -= 1
                    buttonVar = rangeSteps[buttonState]
                }
            }) {
                Circle()
                    .frame(height:30)
                    .overlay(Image(systemName: "minus").foregroundColor(.white))
                    .foregroundColor(.gray)
            }.frame(width: 30)
            
            Slider(value: $sliderVar, in: 1...buttonVar)
                .overlay(
                    Text("1 - \(Int(buttonVar))")
                        .offset(y: -20)
                        .foregroundColor(.gray)
                        .font(.footnote)
                )
            
            Button( action: {
                if buttonState < 8 {
                    buttonState += 1
                    buttonVar = rangeSteps[buttonState]
                }
            }) {
                Circle()
                    .frame(height:30)
                    .overlay(Image(systemName: "plus").foregroundColor(.white))
                    .foregroundColor(.gray)
            }.frame(width: 30)
        }.onAppear(perform: {
            buttonVar = rangeSteps[buttonState]
        })
        
    }
}
