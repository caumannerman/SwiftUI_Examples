//
//  TimerData.swift
//  ObservableExample
//
//  Created by 양준식 on 2022/02/03.
//

import Foundation
import Combine

// ObservableObject
class TimerData: ObservableObject {
    //해당 값이 전달될 때마다 모든 subscriber에게 업데이트 알림
    //project내의 모든 View에서 관찰될 수 있다!!!
    
    @Published var timeCount = 0
    
    var timer : Timer?
    
    init() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerDidFire), userInfo: nil, repeats: true)
    }
    
    @objc func timerDidFire() {
        timeCount += 1
    }
    
    func resetCount(){
        timeCount = 0
    }
}
