//
//  ToggleAnimationView.swift
//  SwiftUI_AnimationDemo
//
//  Created by 양준식 on 2022/02/26.
//

import SwiftUI

struct ToggleAnimationView: View {
    @State private var visibility = false
    
    @State private var isSpinning: Bool = true
    
    var body: some View {
        NavigationView{
            VStack{
                Toggle(isOn: $visibility.animation(.linear(duration: 2))){
                    Text("Toggle Text Views")
                } .padding()
                
                if visibility {
                    Text("Hello WOrld")
                        .font(.largeTitle)
                        .padding(40)
                }
                
                if !visibility {
                    Text("Goodbye World")
                        .font(.largeTitle)
                        .padding(40)
                }
                Divider()
                
                ZStack{
                    Circle()
                        .stroke(lineWidth: 2)
                        .foregroundColor(Color.blue)
                        .frame(width: 360, height: 360)
                    
                    Image(systemName: "forward.fill")
                        .font(.largeTitle)
                        .offset(y: -180)
                        .rotationEffect(.degrees(isSpinning ? 0 : 360))
                        .animation(Animation.linear(duration: 5)
                                    .repeatForever(autoreverses: false))
                }
                .onAppear(){
                    self.isSpinning.toggle()
                }
                
            }
        }
    }
}

struct ToggleAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleAnimationView()
    }
}
