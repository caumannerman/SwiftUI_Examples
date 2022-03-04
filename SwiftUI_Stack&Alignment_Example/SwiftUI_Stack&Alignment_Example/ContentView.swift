//
//  ContentView.swift
//  SwiftUI_Stack&Alignment_Example
//
//  Created by 양준식 on 2022/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //body는 하나의 하위 View만을 가져야한다
        ScrollView{
        
        VStack{
        
        // VStack default center align
        // 앞: .leading, 뒤: .trailing
        VStack(alignment: .leading){
            Text("Hello, world!")
            Text("This is some long text")
            Text("This is short")
        }
        .frame(width: 300, height: 300, alignment: .center)
        .border(Color.cyan, width: 10)//  테두리 색상, 두께 설정
        .foregroundColor(Color.mint) // 글자 색
   
        
        Divider()
            
        //HStack default .center align
        //.center, .bottom, .firstTextBaseline ...
            // 글자들의 첫 줄 baseline을 기준으로 정렬함 , 글자 크기가 달라서 높이차이 발생
            GeometryReader{ geo in
                HStack(alignment: .firstTextBaseline, spacing: 0){
                    
                Text("This is some text")
                    .font(.largeTitle)
                    .frame(width: geo.size.width / 3, height: (geo.size.height))
                    .border(Color.red)
                Text("This is some much longer text")
                    .font(.body)
                    .frame(width: geo.size.width / 3, height: (geo.size.height))
                    .border(Color.cyan)
                Text("This is short")
                    .font(.headline)
                    .frame(width: geo.size.width / 3, height: (geo.size.height))
                    .border(Color.brown)
                }
                .frame(width: 360, height: 350)
        
            }.frame(width: 360, height: 350)
                .padding()
      
            
            
            Divider()
            
        // alignmentGuide 예시
        // 정렬가이드 사용 시, alignmentGuide()수정자에 지정된 정렬타입은 부모 스택에 사용된 정렬타입과 같아야한다.
                VStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(Color.green)
                        .frame(width: 120, height: 50)
                    Rectangle()
                        .foregroundColor(Color.red)
                        .alignmentGuide(.leading, computeValue: {d in d.width / 2}) // 본인 width 기준 1/2 만큼 앞서서 배치됨
                        .frame(width: 300, height: 50)
                    Rectangle()
                        .foregroundColor(Color.blue)
                        .frame(width: 180, height: 50)
                }
                .frame(width:400, height:300)
                .border(Color.brown, width: 3)
            
            Divider()
            
      //커스텀 정렬 타입 아래의 extension 커스텀 정렬 사용
            
            HStack(alignment: .oneThird) {
                Rectangle()
                    .foregroundColor(Color.black)
                    .frame(width: 50, height: 200)
                Rectangle()
                    .foregroundColor(Color.red)
                    .alignmentGuide(.oneThird, computeValue: { d in d[VerticalAlignment.top] })
                    .frame(width: 50, height: 200)
                Rectangle()
                    .foregroundColor(Color.blue)
                    .alignmentGuide(.oneThird, computeValue: { d in d[VerticalAlignment.bottom]})
                    .frame(width: 50, height: 200)
                Rectangle()
                    .foregroundColor(Color.orange)
                    .alignmentGuide(.leading, computeValue: { d in d[VerticalAlignment.top]})
                    .frame(width: 50, height: 200)
            }.border(Color.black, width: 2)
               
          Divider()
            
    //스택 정렬 교차하기
            
            //표준 정렬타입으로 보라색 원을 VStack내의 두 번쨰, 혹은 세 번째 사각형의 옆에 정렬할 수 있는 방법은 없다.
            HStack(alignment: .crossAlignment, spacing: 20) {
                Circle()
                    .foregroundColor(Color.purple)
                    .alignmentGuide(.crossAlignment, computeValue: { d in d[VerticalAlignment.center]})
                    .frame(width: 100, height: 100)
                VStack(alignment: .center) {
                    Rectangle()
                        .foregroundColor(Color.green)
                        .frame(width: 100, height: 100)
                    Rectangle()
                        .foregroundColor(Color.red)
                        //.alignmentGuide(.crossAlignment, computeValue: { d in d[VerticalAlignment.center] })
                        .frame(width: 100, height: 100)
                    Rectangle()
                        .foregroundColor(Color.cyan)
                        .alignmentGuide(.crossAlignment, computeValue: { d in d[VerticalAlignment.center] })
                        .frame(width: 100, height: 100)
                    Rectangle()
                        .foregroundColor(Color.mint)
                        .frame(width: 100, height: 100)
                    
                }
            }
            
            Divider()
            
            
            
            }
        }
    }
}

// 뷰의 지정된 끝에서 1/3 거리 위치로 정렬하게 해주는 extension 커스텀 정렬
// HStack에 적용되는 정렬은 VerticalAlignment이고, VStack에는 HorizontalAlignment가 적용딘다. 해당사항에 extension해줘서 사용
extension VerticalAlignment {
    //alignmentID 프로토콜 준수
    private enum OneThird : AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat { // 정렬 가이드 위치를 가리키는 CGFloat 값을 반환해야함
            return d.height * 2 / 3
        }
    }
   static let oneThird = VerticalAlignment(OneThird.self)
    
    // 두 번쨰 예제용
    private enum CrossAlignment : AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[.bottom]
        }
    }
    static let crossAlignment = VerticalAlignment(CrossAlignment.self)
    
    enum MyVertical: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[VerticalAlignment.center]
        }
    }
    static let myAlignment = VerticalAlignment(MyVertical.self)
}

extension HorizontalAlignment {
    enum MyHorizontal: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[HorizontalAlignment.center]
        }
    }
    static let myAlignment = HorizontalAlignment(MyHorizontal.self)
}

extension Alignment {
    static let myAlignment =  Alignment(horizontal: .myAlignment, vertical: .myAlignment)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
