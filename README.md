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
-> GeometryReader { geometry in  ~~~ } 내부에서 geometry.size.width  혹은 geometry.size.height를 이용해서 수치적을 내부 뷰들으 크기를 조절


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
##### -> @state 프로퍼티 "래퍼"를 사용해 선언
##### -> 상태값으 해당 View에 속하 것이므로 private로 선언 
###### ==> state property값 변경 -> 해당 프로퍼티에 의존하는 모든 View가 update됨 

### 뷰와 state property  바인딩

##### -> 프로퍼 이름 앞에 '$'를 붙여 Binding 

# 3. Observable Object Example

### 3-1. Observable Object

###
