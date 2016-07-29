# box model

## 1. 정의
 - 페이지의 모든 엘리먼트는 사각형 박스이다.
 - content / padding / border / margin으로 구성된 것을 칭함

 ![box-model](images/box-model.PNG)

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
 
## 3. box modeling 계산
 - 브라우저에서 html을 rendering 시 box model calcaulation이 발생
 - 브라우저 계산 순서 : box model(엘리먼트 자체의 Metrics 계산) -> layout(normal flow) 
 - css 계산 우선순위 : inline > 내부 css > 외부 css > borwser dafault
 - layout 배치 후 float 또는 position에 따라 positioning 과정이 한번더 발생 함 (4번 예제 참고)
   - float : box model -> normal flow -> floating
   - relative : box model -> normal flow -> positioning
   - absolute : box model -> positioning
 - box modeling 계산 시 전체 너비 / 높이
   - 전체 너비 : margin-right + border-right + padding-right + width + padding-left + border-left + margin-left
   - 전테 높이 : margin-top + border-top + padding-top + height + padding-bottom + border-bottom + margin-bottom 
 
## 4. box modeling 예제

### 1) relative position
```
<html>
<head>
    <style>
        body div {
            border: 1px solid;    
        }
        
        .relative1 {
          position: relative;
          height: auto;
          margin-top:10px;
        }
        
        .relative4 {
          position: relative;
          display: inline-block;
          width: 400px;
          height: 100px;
        } 
        
        .relative5 {
          position: relative;
          float:left;
          width: 400px;
          height: 100px;
        } 
    </style>
</head>
<body>
    <div class="relative1">
        <div class="relative4">
            div1
        </div>
        <div class="relative4">
            div2
        </div>
    </div>
    
    <div class="relative1">
        <div class="relative5">
            div1
        </div>
        <div class="relative5">
            div2
        </div>
    </div>
</body>
</html>
```
[예제](http://codepen.io/skypentum/pen/NAYvVN?editors=1000)
 
 - display 적용 시 : 내부 DOM이 상대적인 위치로 배치되므로 부모 DOM이 내부 DOM에 설정한 범위를 알 수 있음
 - float 적용 시 : 내부 DOM이 떠있는 상태로 배치되므로 부모 DOM이 내부 DOM에 설정한 범위를 알 수 없음
 - soution : 
    
	1) 빈 element에 clear 속성 설정하여 처리
    
	2) 가상 선택자(:after)를 이용하여 처리

[변경 후 예제](http://codepen.io/skypentum/pen/OXvjZV?editors=1000)

### 2) absolute position
```
<html>
<head>
    <style>
        body div {
            border: 1px solid;    
        }
        
        .absolute1_1 {
          position: absolute;
          height: auto;
          margin-top:10px;
        }
        
        .absolute1_2 {
          position: absolute;
          height: auto;
          margin-top:10px;
        }
        
        .absolute2_1 {
          position: absolute;
          display: inline-block;
          width: 400px;
          height: 100px;
        }
        
        .absolute2_2 {
          position: absolute;
          display: inline-block;
          width: 400px;
          height: 100px;
        }
        
        .absolute3_1 {
          position: absolute;
          float:left;
          width: 400px;
          height: 100px;
        } 
        
        .absolute3_2 {
          position: absolute;
          float:left;
          width: 400px;
          height: 100px;
        } 
    </style>
</head>
<body>
    <div class="absolute1_1">
        <div class="absolute2_1">
            div1
        </div>
        <div class="absolute2_2">
            div2
        </div>
    </div>
    
    <div class="absolute1_2">
        <div class="absolute3_1">
            div1
        </div>
        <div class="absolute3_2">
            div2
        </div>
        <!--<p class="clear-class"></p>-->
    </div>
</body>
</html>
```
 
 [예제](http://codepen.io/skypentum/pen/pbLAXP?editors=1000)

 - 절대적인 위치로 배치되는 경우 DOM이 상대적인 배치를 완전히 벗어나기 때문에 구조상 앞,뒤 요소에 아무런 영향을 미치지 않음
 - solution : 각 DOM별로 width/height 및 box offset을 통해 구성하여야 함
  
 [변경 후 예제](http://codepen.io/skypentum/pen/xOWLoJ?editors=1000)

## 5. 정리
 - box model : content / padding / border / margin으로 구성된 사각형 박스
 - 브라우저에서 html을 rendering 시 box model calcaulation이 발생하며, float 또는 position에 따라 배치함
 - position은 절대적인 위치(absolute/fixed)와 상대적인 위치(relative)가 있음
 - 절대적인 위치의 경우 float 속성은 none으로 평가가 되며, box offset 속성으로 position함
 - 상대적인 위치의 경우 display와 box offset에 따라 배치됨
 - float의 경우 float 속성에 따라 배치되며, 이 후 float을 초기화 할 경우 clear 속성을 설정함 

## cf) UI 최적화를 위한 방법

### 1. reflow 또는 repaint를 가급적 적게 발생시킨다.
 - reflow : 문서 내 노드들의 레이아웃, 포지션을 재계산 후 브라우져에 다시 배치함 
 - repaint : 노드들의 포지션에 영향을 미치지 않고 스킨에 변화가 발생하여 다른 노드들의 스킨까지 검증함
 - 기본적으로 reflow, repaint 처리는 브라우져에서 자동으로 처리하지만 개발자의 역량에 따라서 reflow를 여러번 발생 시킬 수 있어 퍼포먼스 측면에서 비용 낭비를 초래함
 - 클래스 변화에 따른 스타일 변화를 원할 경우, 최대한 DOM 구조 상 끝단에 위치한 노드에 reflow를 처리함
 
### 2. 인라인 스타일을 최대한 배제하라.
 - 인라인 상에 스타일을 줄 경우 리플로우가 페이지 전체에 걸쳐 수차례 발생하므로, 외부 스타일의 클래스 조합으로 한번만 리플로우를 발생시킨다.

### 3. CSS 하위 선택자는 필요한 만큼만 정리하라.
 - 필요 이상의 css rule을 작성해 놓을 경우 퍼포먼스의 하락을 가져올 수 있으므로, 딱 필요한 선에서 핵심만을 짚는 css rule을 적용한다.
 
### 4. position: relative 사용 시 주의할 점
 - position을 relative로 설정한 경우 absolute나 float에 비해서 더 큰 비용을 가짐(randering 단계가 차이남)
 - 반복되는 요소에 적용 시 퍼포먼스 하락이 발생할 가능성이 크다.

### 5. 자바스크립트를 통해 스타일 변화를 주어야 할 경우, 가급적 한번에 처리하라
```
// inline style로 적용할 경우
var toChange = document.getElementById('elem'); //reflow 발생 안함
toChange.style.background = '#333'; //reflow 발생
toChange.style.color = '#fff'; //reflow 발생
toChange.style.border = '1px solid #ccc'; //reflow 발생

// class style로 적용할 경우
// CSS
#elem { 
	border:1px solid #000; color:#000; background:#ddd; 
}
.highlight { 
	border-color:#00f; color:#fff; background:#333; 
}

// js
document.getElementById('elem').className = 'highlight'; // reflow 발생
```
 
## 참조 사이트
```
https://developer.mozilla.org/ko/docs/Web/CSS/CSS_Box_Model/Introduction_to_the_CSS_box_model
http://nolboo.kim/blog/2013/07/22/beginners-guide-to-html-and-css-3-slash-10/
https://lists.w3.org/Archives/Public/public-html-ig-ko/2011Sep/att-0031/Reflow_____________________________Tip.pdf
```

