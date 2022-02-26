//
//  ContentView.swift
//  GestureDemo
//
//  Created by 양준식 on 2022/02/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        // 한 번 탭 하는 제스처
        let tap = TapGesture()
            .onEnded{ _ in
                print("Tapped")
            }
        // 더블 탭
        let doubleTap = TapGesture(count: 2)
            .onEnded{ _ in
                print("Double Tapped")
            }
        // 롱 프레스 제스처
        let longPress = LongPressGesture(minimumDuration: 3, maximumDistance: 10)
            .onEnded{ _ in
                print("Long Press")
            }
        
        VStack{
            HStack{
                Text("Tap")
                Image(systemName: "hand.point.right.fill")
                .gesture(tap)
                .padding(50)
            }
            
            HStack{
                Text("Double Tap")
            
                Image(systemName: "hand.point.right.fill")
                    .gesture(doubleTap)
                    .padding(50)
            }
            
            HStack{
                Text("Long Tap")
                Image(systemName: "hand.point.right.fill")
                    .gesture(longPress)
            }
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
