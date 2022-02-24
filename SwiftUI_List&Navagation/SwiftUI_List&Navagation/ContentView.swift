//
//  ContentView.swift
//  SwiftUI_List&Navagation
//
//  Created by 양준식 on 2022/02/22.
//

import SwiftUI


var listData: [TodoItem] = [ TodoItem(task: "Take our trash", imageName: "trash.circle.fill"),
                             TodoItem(task: "Pick up the kids", imageName: "person.2.fill"),
                             TodoItem(task: "Wash the car", imageName: "car.fill")]

struct ContentView: View {
    //아래의 정적 + 동적 리스트 뷰에서의 사용을 위한 토글버튼 value 프로퍼티
    @State var toggleStatus = true
    
    var body: some View {
        
        VStack{
        //List 뷰 : 수직 방향 목록 형태로 나열
       
            // 1. List뷰와 HStack을 이용하여 항목 나열
            List{
                //각 셀이 하나의 컴포넌트만 있어야한다는 제약은 없음
                HStack{
                    Image(systemName: "trash.circle.fill")
                    Text("Wash the car")
                }
                HStack{
                    Image(systemName: "person.2.fill")
                    Text("Vacuum house")
                }
                HStack{
                    Image(systemName: "trash.circle.fill")
                    Text("Auction the things on eBay")
                }
                HStack{
                    Image(systemName: "car.fill")
                    Text("Pick up kids from school bus @ 3pm")
                        .lineLimit(1)
                }
                HStack{
                    Image(systemName: "wifi")
                    Text("Order Pizza for dinner")
                }
            }
        Divider()
            
            //2. Identifiable 프로토콜을 따르는 구조체 데이터를 가진 데이터셋을 리스트뷰로 "동적" 나열 !!
            List(listData) { item in
                // listData에 들어있는 각각의 item을 아래의 코드로 반복한다고 보면 된다.
                HStack {
                    Image(systemName: item.imageName)
                    Text(item.task)
                }
            }
        Divider()
            
            //3. 리스트에 동적 data와 정적 data 모두 함께 표현해야하는 경우
            // List()에 데이터를 전달해주지 말고 내부에서 ForEach문을 사용하자
            // 2번과 ForEach 쓰냐마냐 차이
            List{
                // Section뷰를 이용해 헤더, 푸터가 있는 섹션으로 나눌 수 있다.
                Section(header: Text("Settings")){
                    //이 부분이 정적 데이터 표시하는 부분
                    Toggle(isOn: $toggleStatus){
                        Text("Allow Notifications")
                    }
                }
                
                Section(header: Text("To Do Tasks")) {
                    //이 곳에서 동적으로 리스트 데이터를 표시
                    ForEach(listData) {
                        item in
                        HStack {
                            Image(systemName: item.imageName)
                            Text(item.task)
                        }
                    }
                }
            }
            
        Divider()
            
            //4. 일반적으로 List뷰는 (세부 페이지로) 이동하는 수단이다.
            // List선언부를 NavigationView로 감싸고, 각 행을 NavigationLink로 감싸면 됨
            // NavigationView와 NavigationLInk를 이용하여 리스트의 항목 클릭 시, 대상 뷰로 이동하도록 !
            NavigationView{
                List{
                    // Section뷰를 이용해 헤더, 푸터가 있는 섹션으로 나눌 수 있다.
                    Section(header: Text("Settings")){
                        //이 부분이 정적 데이터 표시하는 부분
                        Toggle(isOn: $toggleStatus){
                            Text("Allow Notifications")
                        }
                    }
                    
                    Section(header: Text("To Do Tasks")) {
                        //이 곳에서 동적으로 리스트 데이터를 표시
                        ForEach(listData) {
                            item in
                            HStack {
                                // NavigationLink는 할 일에 대한 제목을 표시하는 Text뷰를 가지는 새로운 화면을 보여준다
                                NavigationLink(destination: Text(item.task)){
                                    Image(systemName: item.imageName)
                                    Text(item.task)
                                }
                            }
                        }
                        
                    }
                }
                .navigationBarTitle(Text("To Do List"))
                .navigationBarItems(trailing: EditButton())
//                .navigationBarItems(trailing: Button(action: addTask) {
//                    Text("Add")
//                })
                
            }
        
            
            
            
        
            
        }
    }
}

func deleteItem(at offsets: IndexSet){
    //항목 삭제하는 코드
}


func moveItem(from cource: IndexSet, to destination: Int) {
    //항목 재배열 하는 코드
}

// SwiftUI의 동적리스트는 표시할 데이터가 Identifiable 프로토콜을 따르는 클래스 혹은 구조체 내에 포함되어야함.
// Identifiable 프로토콜 : 리스트에서 각 항목 식별하는 id라는 이름의 프로퍼티가 객체에 있어야함.
struct TodoItem : Identifiable {
    var id = UUID() // 각각의 객체가 생성될 때마다 UUID 프로퍼티 id 생성
    var task: String
    var imageName: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
