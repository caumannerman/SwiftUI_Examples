//
//  ContentView.swift
//  SwiftUI_Example
//
//  Created by 양준식 on 2022/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 15){
            
            Text("Financial Results")
                .font(.title)
            
            HStack(alignment: .top){
            Text("Q1 Sales")
                .font(.headline)
            Spacer()

            VStack(alignment: .leading){
                Text("January")
                Text("February")
                Text("March")
            }
            Spacer()
        
            VStack(alignment: .leading){
                Text("$1000")
                Text("$200")
                Text("$3000")
            }
                .padding(5)

        }
            .padding(5)
            
            // layoutPriotity로서 우선순위(생략하지 않도록)를 둘 수 있다.
            HStack{
                Image(systemName: "airplane")
                Text("Flight times: ")
                Text("LineLimit&layoutPriority").layoutPriority(1)
            }.font(.largeTitle)
                .lineLimit(1) // 표현될 줄의 수를 나타낸다
         
            // min,max W,H를 설정하여 값의 변화에 유연한 프레임 가질 수 있다.
            Text("Hello swiftUI frame size practice")
                .font(.largeTitle)
                .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight:100, alignment: .center)
                .border(Color.cyan)
            // GeometryReader를 이용하여 frame의 크기를 기준으로 내부 frame크기, font크기를 수정할 수 있다.
            GeometryReader { geometry in
                HStack{
                    
                    Text("View size using GeometryReader")
                        .font(.largeTitle)
                        .frame(width: geometry.size.width / 2,
                               height: (geometry.size.height / 2) )
                        .border(Color.red)
                    Text("Geometry\n Reader")
                        .font(.largeTitle)
                        .frame(width: geometry.size.width / 3 + 30,
                               height: geometry.size.height / 2, alignment: .center)
                        .border(Color.mint)
                        
                    
                        
                    
                }.frame(width: 400, height: 400)
                    
                .border(Color.black)
            }.frame(width:400, height:400)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
