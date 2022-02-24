//
//  ContentView.swift
//  ListNavigationDemo
//
//  Created by 양준식 on 2022/02/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var carStore: CarStore = CarStore(cars: carData)
    
    var body: some View {
        
        NavigationView{
            List{
                ForEach (carStore.cars) {
                    car in
                    //List뷰를 SubView로 Extract한다.
                    ListCell(car: car)
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .navigationBarTitle(Text("EV Cars"))
            .navigationBarItems(
                leading: NavigationLink(destination:AddNewCar(carStore: self.carStore)){
                Text("Add")
                    .foregroundColor(.blue)
            }, trailing: EditButton())
        }
    }
    
    func deleteItems(at offsets: IndexSet){
        carStore.cars.remove(atOffsets: offsets)
    }
    
    func moveItems(from source: IndexSet, to destination: Int){
        carStore.cars.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// ContentView의 가독성을 위해, List 관련 View를 SubView로 추출하였다.
struct ListCell: View {
    // 위 body에서 ForEach문으로 하나씩 접근한 car 객체를 전달받아야하므로 var car를 만들어준다.
    var car: Car
    var body: some View {
        
        NavigationLink(destination: CarDetail(selectedCar: car)){
            HStack{
                Image(car.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 60)
                Text(car.name)
                    .font(.body)
                    .foregroundColor(Color.black)
                
            }
        }
    }
}
