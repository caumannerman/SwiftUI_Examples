//
//  ContentView.swift
//  ObservableExample
//
//  Created by 양준식 on 2022/02/03.
//

import SwiftUI

struct ContentView: View {
    
    // Observable객체 생성
    @ObservedObject var timerData: TimerData = TimerData()
    
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                Text("Timer count = \(timerData.timeCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Button(action: timerData.resetCount) {
                    Text("Reset Counter")
                }
                // 다음 View에 Observable Object 참조를 전달한다. 
                NavigationLink(destination: SecondView(timerData: timerData)) {
                    Text("Next Screen")
                }
                .padding()
            }
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
