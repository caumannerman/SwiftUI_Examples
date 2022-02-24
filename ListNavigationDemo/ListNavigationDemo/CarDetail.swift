//
//  CarDetail.swift
//  ListNavigationDemo
//
//  Created by 양준식 on 2022/02/24.
//

import SwiftUI

struct CarDetail: View {
    // ContentView에서 선택한 Car정보를 넘겨받아와야하므로 프로퍼티 만들어줌
    let selectedCar: Car
    
    var body: some View {
        
        Form{
            Section(header: Text("Car Details")) {
                Image(selectedCar.imageName)
                    .resizable()
                    .cornerRadius(12.0)
                // 정비율
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Text(selectedCar.name)
                    .font(.headline)
                
                Text(selectedCar.description)
                    .font(.body)
                
                HStack{
                    Text("Hybrid")
                        .font(.headline)
                    Spacer()
                    // Hybrid 여부 Boolean값으로 X , check 이미지 렌더링
                    Image(systemName: selectedCar.isHybrid ? "checkmark.circle" : "xmark.circle")
                        .foregroundColor(SwiftUI.Color.cyan)
                }
            }
        }
    }
}

struct CarDetail_Previews: PreviewProvider {
    static var previews: some View {
        CarDetail(selectedCar: carData[0])
    }
}
