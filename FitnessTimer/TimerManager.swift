//
//  TimerManager.swift
//  FitnessTimer
//
//  Created by Michael Gemsa on 21.11.21.
//

import Foundation

class TimerManager: ObservableObject {
    
    var timer = Timer()
    @Published var timerActive: Bool = false
    @Published var duration: Int = 0
    @Published var pause: Int = 0
    @Published var repetitions: Int = 0
    
    init() { }
    
    func setTimer(set_sec: Int, set_pause: Int) {
        let seconds = set_sec
        let pause = set_pause
        self.duration = seconds
        self.pause = pause
    }
    
    func setRepetitions(set_reps: Int) {
        let repetitions = set_reps
        self.repetitions = repetitions
    }
    
    func startTimer(sec: Int, pau: Int, rep: Int) {
        if sec*pau*rep != 0 {
            setRepetitions(set_reps: rep)
            setTimer(set_sec: sec, set_pause: pau)
            self.timerActive = true
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if self.duration > 0 {
                    self.duration -= 1
                } else {
                    if self.pause > 0 {
                        self.pause -= 1
                    } else {
                        self.stopTimer()
                        if self.repetitions > 1 {
                            self.repetitions -= 1
                            self.startTimer(sec: sec, pau: pau, rep: self.repetitions)
                        } else {
                            self.repetitions = 0
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
