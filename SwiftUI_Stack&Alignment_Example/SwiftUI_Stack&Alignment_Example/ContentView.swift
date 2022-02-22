//
//  ContentView.swift
//  SwiftUI_Stack&Alignment_Example
//
//  Created by 양준식 on 2022/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //body는 하나의 View만을 가져야한다
        VStack{
        
        // VStack default center align
        // 앞: .leading, 뒤: .trailing
        VStack(alignment: .leading){
            Text("Hello, world!")
            Text("This is some long text")
            Text("This is short")
        }
        
        Divider()
            
        //HStack default .center align
        //.center, .bottom, .firstTextBaseline ...
        HStack(alignment: .bottom, spacing: 20){
        Text("This is some text")
            .font(.largeTitle)
        Text("This is some much longer text")
            .font(.body)
        Text("This is short")
            .font(.headline)
        }
            
        Divider()
            
        // alignmentGuide 예시
        
            VStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.green)
                    .frame(width: 120, height: 50)
                Rectangle()
                    .foregroundColor(Color.red)
                    .alignmentGuide(.leading, computeValue: {d in d.width/2})
                    .frame(width: 200, height: 50)
                Rectangle()
                    .foregroundColor(Color.blue)
                    .frame(width: 180, height: 50)
            }
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
