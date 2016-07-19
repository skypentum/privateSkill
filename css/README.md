# CSS Position 

## 1. Spec
Value|  	static / relative / absolute / fixed / inherit
Initial|  	static
Applies to|  	all elements
Inherited|  	no
Percentages|  	N/A

## 2. property

### 1) static
 
 - default 값
 
 - 문서 또는 DOM의 위치를 지정하지 않음
 
 - box offset이 적용되지 않음
 ```
<html>
<head>
    <style>
        body div {
            border: 1px solid;    
        }
        
        .static {
          position: static;
        }    
    </style>
</head>
<body>
    <div>this is static position(default)</div>    
    <div class="static">this is 2nd static position</div>
</body>
</html>
 ```

### 2) relative

 - 문서 또는 static으로 정의한 DOM를 기준으로 계산하여 위치를 지정
 
 - box offset 적용 가능

 - 문서의 기본적인 흐름을 따라감
 ```
<html>
<head>
    <style>
        body div {
            border: 1px solid;    
        }
        
        .relative1 {
          position: relative;
        }
        
        .relative2 {
          position: relative;
          top: 20px;
          left: 20px;
          background-color: white;
          width: 500px;
        }   
    </style>
</head>
<body>
    <div class="relative1">
        this is relative1 class
    </div>
    <div class="relative2">
        this is relative2 class
    </div>
</body>
</html>
 ```

### 3) absolute

 - 문서의 시작 위치와 상관없이 위치 지정
  
 - box offset 적용 가능
 
 - 기본적으로 가장 가까운 상위 DOM을 기준으로 위치가 결정
   
   (상위 요소가 없으면 문서를 기준으로 설정)
```
<html>
<head>
    <style>
        body div {
            border: 1px solid;    
        }
        
        .static {
          position: static;
          width: 200px;
        }    
        
        .absolute1 {
          position: absolute;
          top: 0px;
          left: 200px;
          width: 400px;
          height: 50px;
        }
        
        .relative {
          position: relative;
          top: 110px;
          left: 20px;
          width: 500px;
          height: 400px;
        }
        
        .absolute2 {
          position: absolute;
          top: 30px;
          left: 30px;
          width: 100px;
          height: 100px;
        }
    </style>
</head>
<body>
    <div class="static">this is static position(default)</div>
    <div class="absolute1">this is absolute1 position</div>
    <div class="relative">
        this is relative1 class
        <div class="absolute2">this is absolute2 position</div>
    </div>    
</body>
</html>
 ```
 
### 4) fixed
 
 - 문서의 시작 위치와 상관없이 위치 지정
 
 - box offset 적용 가능

 - 상위 DOM의 영향을 받지 않음
 
 - 무조건 문서를 기준으로 설정
```
<div class="relative3">
<html>
<head>
    <style>
        body div {
            border: 1px solid;    
        }
        
        .relative3 {
          position: relative;
          width:400px;
          height: 600px;
        }
        
        .absolute {
          position: absolute;
          top: 120px;
          left: 0px;
          width: 300px;
          height: 200px;
        }
         
        .fixed {
          position: fixed;
          bottom: 0;
          right: 0;
          width: 200px;
        }        
        
    </style>
</head>
<body>
    <div class="relative3">
        this is relative3 position
        <div class="absolute">this is absolute position</div>
        <div class="fixed">this is fixed position</div>
    </div>    
</body>
</html>
```

### cf)box offset

 - position 으로 정의된 box의 위치를 지정해 주기 위한 속성
 
 - left / right, top / bottom 으로 구성
 
 - 각 position 별로 정의 가능한 box offset은 다음과 같다.
  |static|relative|absolute|fixed
 left|x|o|o|o
 top|x|o|o|o
 right|x|ㅁ|o|o
 bottom|x|ㅁ|o|o
 ```
 x - 적용 안됨, o - 적용됨, ㅁ - '-'로 처리됨
 ```

### cf) float
 

## 3. 응용

### 1) 상대적인 위치
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
        
        .clear-class {
            clear: left; // or both
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
        <!--<p class="clear-class"></p>-->
    </div>
</body>
</html>
```
 - display 적용 시 : 내부 DOM이 상대적인 위치로 배치되므로 부모 DOM이 내부 DOM에 설정한 범위를 알 수 있음
 - float 적용 시 : 내부 DOM이 떠있는 상태로 배치되므로 부모 DOM이 내부 DOM에 설정한 범위를 알 수 없음
 - soution : clear 속성을 설정하여 처리

### 2) 절대적인 위치
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
 - 절대적인 위치로 배치되는 경우 DOM이 상대적인 배치를 완전히 벗어나기 때문에 구조상 앞,뒤 요소에 아무런 영향을 미치지 않음
 - solution : 각 DOM별로 width/height 및 box offset을 통해 구성하여야 함

## 4. 정리
 - position은 절대적인 위치(absolute/fixed)와 상대적인 위치(relative/)가 있음
 - 이 중 상대적인 위치는 일반적인 흐름과 float 상태로 배치가 가능
 - 절대적인 위치의 경우 float 속성은 none으로 평가가 되며, box offset 속성으로 position함
 - 상대적인 위치의 경우 float 속성 또는 display 속성에 따라 배치되며, float을 초기화 할 경우 clear 속성을 설정함

## 참고 사이트
```
https://www.w3.org/TR/CSS2/visuren.html#propdef-position
http://mkyoon.com/56
http://aboooks.tistory.com/82
http://blog.wystan.net/2009/01/12/relationships-between-position-float-display
```




