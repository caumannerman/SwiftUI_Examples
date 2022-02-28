//
//  ContentView.swift
//  TabViewDemo
//
//  Created by 양준식 on 2022/02/24.
//

import SwiftUI

struct ContentView: View {
    // TabView 선택을 위한 State Property
    @State private var selection: String = "1"
    
    //State properties for Context Menu Example
    
    @State private var foregroundColor: Color = Color.blue
    @State private var backgroundColor: Color = Color.white
    
    var body: some View {
        VStack{
       
        TabView(selection: $selection){
            // 보여주고싶은 View에 tabItem() 수정자를 달아서 각 콘텐트 뷰에 TabItem을 단다
            Text("First Content View")
                .font(.largeTitle)
                .padding()
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .contextMenu{
                    //뷰에서 롱 프레스 제스쳐를 할 때 나타남. 모든 뷰 타입에 추가될 수 있다
                    // contextMunu()수정자를 사용하여 구현. ( 보통 button형태로 구현 )
                    Button(action: {
                        self.foregroundColor = .black
                        self.backgroundColor = .white
                    }){
                        Text("Normal Colors")
                        Image(systemName: "paintbrush")
                    }
                    
                    Button(action: {
                        self.foregroundColor = .white
                        self.backgroundColor = .black
                    }){
                        Text("Inverted Colors")
                        Image(systemName: "paintbrush.fill")
                    }
                }
            
                .tabItem{
                    Image(systemName:
                            "1.circle")
                    Text("Screen One")
                }.tag("1")
            
            Text("Second Content View")
                .tabItem{
                    Image(systemName: "2.circle")
                    Text("Screen Two")
                }.tag("2")
            
            Text("Third Content View")
                .tabItem{
                    Image(systemName: "3.circle")
                    Text("Screen Three")
                }.tag("3")
        }
        
        .font(.largeTitle)
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
   
.previewInterfaceOrientation(.portrait)
        }
    }
}
