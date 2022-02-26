//
//  ContentView.swift
//  SwiftUI_AnimationDemo
//
//  Created by 양준식 on 2022/02/25.
//

import SwiftUI

//뷰가 가진  크기, 불투명도, 색, 회전각도 등 외형 제어 animation으로 가능
//1. animation 수정자 ==> 암묵적 애니메이션 (implicit animation) ( 수정자 앞 모든 수정자에 암묵적으로 애니메이션 되도록 하기 때문 )
//2.

struct ContentView: View {
    
    // 회전 애니메이션을 위한 state property
    @State private var rotation: Double = 0
    // 크기 애니메이션을 위한 state property
    @State private var scale: CGFloat = 1
    
    // Explicit 회전 애니메이션을 위한 state property
    @State private var rotation_ex: Double = 0
    // Explicit 크기 애니메이션을 위한 state property
    @State private var scale_ex: CGFloat = 1
    
    var body: some View {
        NavigationView{
        VStack{
            Text("암묵적 애니메이션 Implicit animation")
                .font(.headline)
                .padding(20)
            
            Button(action: {
                self.rotation = (self.rotation < 360 ? self.rotation + 60 : 0)
                self.scale = (self.scale < 2.8 ? self.scale + 0.3 : 1)
            }) {
                Text("Click to animate")
                    .scaleEffect(scale)
                    .rotationEffect(.degrees(rotation))
                   // .animation(.easeInOut(duration: 1)) // 회전효과의 속도를 줄이고 부드럽게 회전! 점점 빨라질지, 일정한 속도로 수행될지 제어 .easeOut, .easeIn, .easeInOut 등
                    //.animation(.spring(response: 1, dampingFraction: 0.2, blendDuration: 0))// spring처럼 지정 범위 살짝 벗어났다 돌아오는 애니메이션
                    .animation(Animation.linear(duration: 1).repeatCount(10, autoreverses: false))// 애니메이션 반복 횟수, 원 상태로 돌아가는 것 설정
            }.padding(120)
            
            Divider()
            
            
            
            Text("명시적 애니메이션 Explicit animation")
                .font(.headline)
                .fontWeight(.bold)
                .padding(20)
            //withAnimation() 수정자 - 클로저 내부에서 변경된 프로퍼티만 애니메이션 됨 !!
            //따라서 여기서는 클릭 시, 크기는 곧바로 변동, 회전에만 duration이 적용됨
            Button(action: {withAnimation(.linear (duration: 2)){
                self.rotation_ex = (self.rotation_ex < 360 ? self.rotation_ex + 60 : 0)
            }
                self.scale_ex = (self.scale_ex < 2.8 ? self.scale_ex + 0.3 : 1)
            }) {
                Text("Click to Animate")
                    .rotationEffect(.degrees(rotation_ex))
                    .scaleEffect(scale_ex)
                    
            }.padding(120)
        
         
                NavigationLink(destination: ToggleAnimationView()){
                    Text("Next Exmaple")
                }
        }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
