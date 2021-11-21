//
//  TimerManager.swift
//  FitnessTimer
//
//  Created by Michael Gemsa on 21.11.21.
//

import Foundation
import AVFoundation

class TimerManager: ObservableObject {
    
    var timer = Timer()
    @Published var timerActive: Bool = false
    @Published var duration: Int = 0
    @Published var pause: Int = 0
    @Published var repetitions: Int = 1
    @Published var maxRepititions: Int = 1
    
    init() { }
    
    func setTimer(set_sec: Int, set_pause: Int) {
        let seconds = set_sec
        let pause = set_pause
        self.duration = seconds
        self.pause = pause
    }
    
    func setRepetitions(set_reps: Int, set_MaxReps: Int) {
        let repetitions = set_reps
        let maxRepetitions = set_MaxReps
        self.repetitions = repetitions
        self.maxRepititions = maxRepetitions
    }
    
    func startTimer(sec: Int, pau: Int, rep: Int, maxRep: Int) {
        if sec*pau*rep*maxRep != 0 {
            setRepetitions(set_reps: rep, set_MaxReps: maxRep)
            setTimer(set_sec: sec, set_pause: pau)
            self.timerActive = true
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if self.duration > 0 {
                    self.duration -= 1
                    if self.duration == 0 {
                        AudioServicesPlaySystemSound(1106)
                    }
                } else {
                    if self.pause > 0 {
                        self.pause -= 1
                    } else {
                        self.stopTimer()
                        if self.repetitions < self.maxRepititions {
                            self.repetitions += 1
                            AudioServicesPlaySystemSound(1105)
                            self.startTimer(sec: sec, pau: pau, rep: self.repetitions, maxRep: maxRep)
                        } else {
                            self.repetitions = 1
                        }
                    }
                }
            }
        }
    }
    
    func stopTimer() {
        self.timerActive = false
        timer.invalidate()
        duration = 0
        pause = 0
    }
    
}
