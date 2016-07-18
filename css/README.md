# CSS Position 

## 1. Spec
|Value|  	static / relative / absolute / fixed / inherit|
|Initial|  	static|
|Applies to|  	all elements|
|Inherited|  	no|
|Percentages|  	N/A|

## 2. property

### 1) static
 
 - default 값
 
 - 문서 또는 DOM의 위치를 지정하지 않음
 
 - box offset이 적용되지 않음
 
 - 보통은 사용할 일이 없지만 앞의 DOM에 설정된 position을 무시할 때 사용됨(어떻게??)

### 2) relative

 - 문서 또는 static으로 정의한 DOM를 기준으로 계산하여 위치를 지정
 
 - box offset 적용 가능

 - 문서의 기본적인 흐름을 따라감

### 3) absolute

 - 문서의 시작 위치와 상관없이 위치 지정
  
 - box offset 적용 가능
 
 - 기본적으로 가장 가까운 상위 DOM을 기준으로 위치가 결정
   
   (상위 요소가 없으면 문서를 기준으로 설정)
 
### 4) fixed
 
 - 문서의 시작 위치와 상관없이 위치 지정
 
 - box offset 적용 가능

 - 상위 DOM의 영향을 받지 않음
 
 - 무조건 문서를 기준으로 설정

#### cf)box offset

 - position 으로 정의된 box의 위치를 지정해 주기 위한 속성
 
 - left / right, top / bottom 으로 구성
 
 - 각 position 별로 정의 가능한 box offset은 다음과 같다.
 ||static|relative|absolute|fixed|
 |left|x|o|o|o|
 |top|x|o|o|o|
 |right|x|x|o|o|
 |bottom|x|x|o|o|
 

## 3. 응용

### 1) relative + relative

### 2) absolute + absolute

### 3) relative + absolute

### 4) relative + fixed

### 5) absolute + fixed

### 6) float

## 참고 사이트
```
https://www.w3.org/TR/CSS2/visuren.html#propdef-position
http://mkyoon.com/56
http://aboooks.tistory.com/82
http://blog.wystan.net/2009/01/12/relationships-between-position-float-display
```




