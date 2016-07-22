# Position 

## 1. Potition 

### 1.1. Spec
spec | position
------------ | -------------
Value|  	static / relative / absolute / fixed / inherit
Initial|  	static
Applies to|  	all elements
Inherited|  	no
Percentages|  	N/A

### 1.2. property

### 1) static
 
 - default 값
 
 - 문서 또는 요소의 위치를 지정하지 않음
 
 - box offset이 적용되지 않음

 [예제](http://codepen.io/skypentum/pen/kXEoqo?editors=1000)

### 2) relative

 - 문서 또는 static으로 정의한 요소를 기준으로 계산하여 위치를 지정
 
 - box offset 적용 가능

 - 문서의 기본적인 흐름을 따라감
 
 [예제](http://codepen.io/skypentum/pen/dXmzAw?editors=1000)

### 3) absolute

 - 문서의 시작 위치와 상관없이 위치 지정
  
 - box offset 적용 가능
 
 - 기본적으로 가장 가까운 상위 요소를 기준으로 위치가 결정
   
   (상위 요소가 없으면 문서를 기준으로 설정)

 [예제](http://codepen.io/skypentum/pen/OXvjGP?editors=1000)
 
### 4) fixed
 
 - 문서의 시작 위치와 상관없이 위치 지정
 
 - box offset 적용 가능

 - 상위 요소의 영향을 받지 않음
 
 - 무조건 문서를 기준으로 설정

[예제](http://codepen.io/skypentum/pen/RRrkOm?editors=1000)

## 2. box offset

### 2.1 spec

spec|position
------------ | -------------
Value|  	<length> | <percentage> | auto | inherit
Initial|  	auto
Applies to|  	positioned elements
Inherited|  	no
Percentages|  block의 width/height를 참조

### 2.2 property
 
 - left / right, top / bottom 으로 구성
 
 - 각 position 별로 정의 가능한 box offset은 다음과 같다.
 
 - length인 경우
 
 offset|static|relative|absolute|fixed
 ------------ | ------------- | ------------ | ------------- | ------------
 left|x|o|o|o
 top|x|o|o|o
 right|x|ㅁ|o|o
 bottom|x|ㅁ|o|o
 ```
 x - 적용 안됨, o - 적용됨, ㅁ - '-'로 처리됨
 ```
 
 [예제](http://codepen.io/skypentum/pen/xOWQAw?editors=1000)

 - percentage인 경우
 
 offset|static|relative|absolute|fixed
 ------------ | ------------- | ------------ | ------------- | ------------
 left|x|o|o|o
 top|x|o(단, 부모 요소가 있어야 함)|o|o
 right|x|ㅁ|o|o
 bottom|x|ㅁ(단, 부모 요소가 있어야 함)|o|o
 ```
 x - 적용 안됨, o - 적용됨, ㅁ - '-'로 처리됨
 ```
 
 [예제](http://codepen.io/skypentum/pen/JKLZEY?editors=1000)
 
## 3. display

### 3.1 spec
spec|position
------------ | -------------
Value|  	inline / block / list-item / inline-block / table / inline-table / table-row-group / table-header-group / table-footer-group / table-row / table-column-group / table-column / table-cell / table-caption / none / inherit
Initial|  	inline
Applies to|  	all elements
Inherited|  	no
Percentages|  	N/A

### 3.2 property
 
 - inline : 기본 값, 인라인 박스로 만듬 
 
 - none : 보이지 않음 
 
 - block : 블록 박스로 만듬 (not inline)
 
 - inline-block : block 박스로 만들어지나, inline 처럼 배치함
 
 - table 관련 속성: table 요소에서 배치함
  
 - list-item : LI 요소에서 list로 배치함 
 
## 4. 응용

### 4.1 상대적인 위치
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
 
 - display 적용 시 : 내부 요소가 상대적인 위치로 배치되므로 부모 요소가 내부 요소에 설정한 범위를 알 수 있음
 - float 적용 시 : 내부 요소가 떠있는 상태로 배치되므로 부모 요소가 내부 요소에 설정한 범위를 알 수 없음
 - soution : 
 
    1) 빈 element에 clear 속성 설정하여 처리

    2) 가상 선택자(:after)를 이용하여 처리

[변경 후 예제](http://codepen.io/skypentum/pen/OXvjZV?editors=1000)

### 4.2 절대적인 위치
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
          //width: 100%;
          //height: 100px;
          //top:10px;
          //left: 0px;
        }
        
        .absolute1_2 {
          position: absolute;
          height: auto;
          margin-top:10px;
          //width: 100%;
          //height: 100px;
          //top:110px;
          //left: 0px;
        }
        
        .absolute2_1 {
          position: absolute;
          display: inline-block;
          width: 400px;
          height: 100px;
          //left: 0px;
        }
        
        .absolute2_2 {
          position: absolute;
          display: inline-block;
          width: 400px;
          height: 100px;
          //left: 400px;
        }
        
        .absolute3_1 {
          position: absolute;
          float:left;
          width: 400px;
          height: 100px;
          //left: 0px;
        } 
        
        .absolute3_2 {
          position: absolute;
          float:left;
          width: 400px;
          height: 100px;
          //left: 400px;
        } 
        
        .clear-class {
            clear: left; // or both
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

 - 절대적인 위치로 배치되는 경우 요소가 상대적인 배치를 완전히 벗어나기 때문에 구조상 앞,뒤 요소에 아무런 영향을 미치지 않음
 - solution : 각 요소별로 width/height 및 box offset을 통해 구성하여야 함
  
 [변경 후 예제](http://codepen.io/skypentum/pen/xOWLoJ?editors=1000)

## 4. 정리
 - position은 절대적인 위치(absolute/fixed)와 상대적인 위치(relative/static)가 있음
 - 이 중 상대적인 위치는 display와 float 으로 배치가 가능
 - 상대적인 위치의 경우 float 속성 또는 display 속성에 따라 배치되며, float을 초기화 할 경우 clear 속성을 설정함
 - 절대적인 위치의 경우 float 속성은 none으로 평가가 되며, box offset 속성으로 position함

## 참고 사이트
```
https://www.w3.org/TR/CSS2/visuren.html#propdef-position
http://mkyoon.com/56
http://aboooks.tistory.com/82
http://blog.wystan.net/2009/01/12/relationships-between-position-float-display
http://dev.epiloum.net/834
```




