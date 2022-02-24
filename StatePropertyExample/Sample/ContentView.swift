//
//  ContentView.swift
//  Sample
//
//  Created by 양준식 on 2022/02/02.
//

//이 예제에서는 State프로퍼티를 선언하고, 상태 바인딩까지 예시가 포함되어있다.

import SwiftUI

struct ContentView: View {
    
    // 텍스트가 회전할 각도 상태 프로퍼티
    @State private var rotation: Double = 0
    // 보여질 텍스트 상태 프로퍼티
    @State private var text: String = ""
    //사용자가 글자 색 변경을 위해 선택한 색상 index를 저장할 상태 프로퍼티
    @State private var colorIndex: Int = 0
    
    //상태 바인딩 예제를 위한 state property
    @State private var wifiEnabled: Bool = true
    
    var colors: [Color] = [SwiftUI.Color.black, SwiftUI.Color.red, SwiftUI.Color.green, SwiftUI.Color.blue]
    var colornames = ["Black", "Red", "Green", "Blue"]
  
    
    var body: some View {
        
        VStack{
        Spacer()
           
            Text(text)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .background(Color.white)
                .lineLimit(1)
                .rotationEffect(.degrees(self.rotation))
                .foregroundColor(self.colors[self.colorIndex])
            
            Spacer()
            Divider()
            
            Slider(value: $rotation, in: 0...360, step: 0.1)
                .padding(30)
            
            
            // 소숫점 첫 째 자리까지만 나오도록
            Text(String( floor( rotation * 10 ) / 10))
            
            TextField("Enter text here", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(30)
            
            // colorIndex에 선택한 항목의 index가 저장된다.
            Picker(selection: $colorIndex, label: Text("Color")) {
                // colornames 배열에 저장된 것을을 Picker에 하나씩 보이게 해준다.
                ForEach (0 ..< colornames.count) {
                    Text(self.colornames[$0])
                        .foregroundColor(self.colors[$0])
                      
                }
                
            }.padding()
            
            // wifiEnabled를 상태 binding해준다!!!
            WifiImageView(wifiEnabled: $wifiEnabled)
            //state binding을 실험하기 위한 버튼 ==> wifi이미지가 바뀐다.
            Button("Wifi!") {
                self.wifiEnabled = !self.wifiEnabled
            }
            
            
        }
    }
  
}

struct WifiImageView: View {
    //이 함수에서 wifiEnabled는 선언되지 않은 변수이다.
    //접근할 수 있게 하기 위하여 wifiEnabled를 State Binding해준다.
    @Binding var wifiEnabled : Bool
    var body: some View {
        // binding되어 전달된 값의 참/거짓에 따라 다른 이미지 설정
        Image(systemName: wifiEnabled ? "wifi" : "wifi.slash")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
