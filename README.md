# SwiftUI_Examples

# 1. SwiftUI_Examples

<img width="200" alt="스크린샷 2022-03-03 오후 3 22 13" src="https://user-images.githubusercontent.com/75043852/156508268-7d55ef6a-76d3-44ad-9e54-25d4b07e49ef.png">


### 1-1. HStack, VStack, ZStack 

##### -> HStack(alignment: .center, spacing: 10) : Stack 내부 뷰들의 정렬 기준, 간격 설정

### 1-2. Text()뷰와 modifier 

##### -> font() : 글자의 크기, 모양 설정
##### -> padding() : 뷰 frame 주변에 padding추가
##### -> lineLimit(Int) : 해당 텍스트 뷰의 최대 줄 수 설정. 공간이 부족하며 ...으로 생략된다
##### -> layoutPriority() : 스택 내의 뷰에 추가, 높은 숫자가 더 큰 우선순위 가짐 ( 생략되지 않으려는 경향 가짐 )
##### -> border(Color.black) : 뷰 frame의 색 지정 
##### -> frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: .infinity, alignment: .center) : 뷰 frame의 색상, 너비높이의 최대,최소치, 정렬 설정

### 1-3. Camera 노치 무시 ( 안전영역 ) : .edgesIgnoringSafeArea(.all) 로 설정

### 1-4. GeometryReader : 프레임뷰들을 담고있는 컨테이너 크기에 따라 조절되도록 구현할 수 있다.
-> GeometryReader { geometry in  ~~~ } 내부에서 geometry.size.width  혹은 geometry.size.height를 이용해서 수치적으로 내부 뷰들의 크기를 조절


# 2.SwiftUI_StateProperty_Example

You can rotate the text by moving the slider, and the size of the rotated angle is displayed below the slider. 
You can change the color of the text using the picker.

<p>
  
<img src="https://user-images.githubusercontent.com/75043852/152171279-e15140c3-1b66-405e-97b6-2639d8477b7f.PNG"  width="200" height="400"/>

  <img src="https://user-images.githubusercontent.com/75043852/152171339-9ce73391-e6a7-4408-9969-84b6d95cd4a0.PNG"  width="200" height="400"/>
  <img src="https://user-images.githubusercontent.com/75043852/152171351-c3d99548-37d6-4079-a31f-b61feba72ddd.PNG"  width="200" height="400"/>
  
  <img src="https://user-images.githubusercontent.com/75043852/152171355-174475e3-9611-457b-aab8-2643c1aa8680.PNG"  width="200" height="400"/>

</p>

### 2-1. State Property

##### -> 상태에 대한 기본 형태
##### -> @State 프로퍼티 "래퍼"를 사용해 선언
##### -> 해당 View에 속하 것이므로 private로 선언 
###### ==> state property값 변경 -> 해당 프로퍼티에 의존하는 모든 View가 update됨 

### 2-2. 뷰와 state property  바인딩

##### -> 프로퍼티 이름 앞에 '$'를 붙여 Binding 

### 2-3. Spacer(), Divider()

##### -> Spacer() : 공간을 두고, 같은 클로저 내의 View를 한 쪽으로 밀어서 배치 
##### -> Divider() : 구분 선을 그려 View들을 양 쪽으로 구분지어 배치

# 3. Observable Object Example

<p>
<img width="200" alt="스크린샷 2022-03-03 오후 5 06 04" src="https://user-images.githubusercontent.com/75043852/156522842-afd38fee-85a3-4465-a90b-d511803782dd.png">
<img width="200" alt="스크린샷 2022-03-03 오후 5 06 14" src="https://user-images.githubusercontent.com/75043852/156522858-2190bf63-f7f4-4063-b007-beb30e579527.png">
</p>

ObservableObject 프로토콜을 따르는 TimerData class를 선언하고, timerCount 프로퍼티를 @Published 프로퍼티 래퍼를 통해 게시한다.
ContentView에서 @ObservedObject 프로퍼티 래퍼를 통해 timerData객체를 생성하고, NavigationView와 NavigationLink를 통해 SecondView라는 destination으로 timerData참조를 전달한다.
화면 전환에 관계없이 둘은 같은 객체를 참조하여, 이어지며 시간을 count하는 것을 확인할 수 있다.


### 3-1. Observable Object
  
##### -> Combine 프레임워크에 포함되어있음
##### -> ObservableObject 프로토콜을 따르는 클래스 혹은 구조체 형태
##### -> 타이머나 알림 이벤트 처리에도 사용
##### -> 데이터값을 publish하고, Observer객체가 게시자를 "구독"하여 변경시마다 업데이트한다. ( @ObservedObject 프로퍼티 래퍼로 객체 구독 )
##### -> ObservableObject로 선언, @Published 프로퍼티 래퍼로 게시 

### 3-2. Environment Object
##### UI 밖에 있으며, 여러 뷰가 접근해야하는 데이터? -> Environment Object 
##### -> ObservableObject로 선언, @Published 프로퍼티 래퍼로 게시 
##### -> 선언은 Observable Object와 같이 ObservableObject 프로토콜 따라야 함 ( 참조는 @EnvironmentObject 프로퍼티 래퍼로 참조 )
##### -> SwiftUI환경에 저장됨
##### -> View에서 View로 전달할 필요 없이 어디서든 접근 가능

# 4. Stack&AlignmentGuide Example

<p>
<img width="200" alt="스크린샷 2022-03-04 오후 3 56 44" src="https://user-images.githubusercontent.com/75043852/156714789-d8293950-3d39-4e53-8fbe-358fea75e186.png">
<img width="200" alt="스크린샷 2022-03-04 오후 3 57 02" src="https://user-images.githubusercontent.com/75043852/156714799-9dd688aa-44e1-40f4-aeb2-3ec6e6ded0dd.png">
<img width="200" alt="스크린샷 2022-03-04 오후 3 57 12" src="https://user-images.githubusercontent.com/75043852/156714805-50eae3ae-bdb9-4375-a592-35fc476f63d7.png">
</p>

GeometryReader와 border modifier, .firstTextBaseline과 같은 정렬 기준
alignmentGuide를 사용한 스택 내 개별 위치 조정 ( 부모 Stack의 정렬 기준과 같은 정렬기준을 넣어줘야 적용이 된다 )
VerticalAlignment, HorizontalAlignment에 extension을 추가해 static으로서 사용가능한 정렬 기준을 만들어준다.
표준 정렬타입으로는 다른 스택 간 정렬이 불가능한데, 보라색 원을 오른쪽 VStack의 세 번째 사각형 옆에 정렬이 가능했다.(alignmentGuide)

