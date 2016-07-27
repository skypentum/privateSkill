# box model

## 1. 정의
 - 페이지의 모든 엘리먼트는 사각형 박스이다.
 - content / padding / border / margin으로 구성된 것을 칭함

 ![box-model](/images/box-model.PNG)

## 2. 구성 요소

### 2.1 content
 - 요소의 실제 내용을 포함하는 영역
 - width / height로 구성함
 - width: 
   - default : 100%(가능한 모든 너비를 차지함)
   - inline : content가 차지하는 영역 만큼 자동으로 width값 생성(width 설정 값은 적용 안됨)
   - block : 
     - 값이 지정되어 있지 않으면 default로 지정
     - 값이 지정되어 있으면 지정된 값으로 width 값 생성
 - height : 
   - default : content에 의해 자동으로 height값 생성(auto)
   - inline : 적용되지 않음
   - block 
     - 값이 지정되어 있지 않으면 default로 지정
     - 값이 지정되어 있으면 지정된 값으로 height 값 생성
    
[예제](http://codepen.io/skypentum/pen/dXKkrb?editors=1000)    

### 2.2 padding
 - 엘리먼트의 border 안에 위치함
 - 엘리먼트의 안의 여백을 제공 
 - padding / padding-top / padding-right / padding-bottom / padding-left로 구성
 
 [예제](http://codepen.io/skypentum/pen/XKYzZO?editors=1000)

### 2.3 border 
 - padding과 margin 사이에 위치
 - 엘리먼트 주위의 outline을 제공함
 - border-width 또는 border(width / style / color)로 구성
 
 [예제](http://codepen.io/skypentum/pen/QExOQm?editors=1010)

### 2.4 margin
 - 엘리먼트의 경계선 밖에 위치함
 - 엘리먼트 배치로 쓰임
 - margin / margin-top / margin-right / margin-bottom / margin-left로 구성
 
 [예제](http://codepen.io/skypentum/pen/pbKdxx?editors=1000)

## 참조 사이트
```
https://developer.mozilla.org/ko/docs/Web/CSS/CSS_Box_Model/Introduction_to_the_CSS_box_model
http://nolboo.kim/blog/2013/07/22/beginners-guide-to-html-and-css-3-slash-10/
```