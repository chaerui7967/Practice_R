#벡터 만들기
x<-c(80,75,70)
x
c(80,75,70)->x
x

#벡터 원소가 하나일 때
y<-c(80)
y
c(80)->y
y

#산술연산
x<-5+2
x
x<-5/3
x
x<5^2
x
x<-5%%3
x
x<-5%/%3
x

#벡터의 사칙연산
x<-c(1,2,3,4)
y<-c(2,3,4,5)
z<-c(1,2)

w<-x+y
w

w<-x+5
w

w<-y/2
w

w<-x+z
w

w<-x/z
w

w<-z/x
w

#서로 다른 데이터 유형과 연산
x<-c(1,2,3)
x

y<-c("A","B","c")
y

y<-c("A",1,2)
y

z<-x+1
z

#비교 연산자
x<-5<3
x

y<-c(10,20,30)
z<-y<=10
z

#논리 연산자
x<-TRUE
y<-FALSE
x|y

x&y

x<-3
!x

isTRUE(y)

z<-c(TRUE,FALSE,FALSE)
z|y

#연속적인 값들의 벡터 만들기
x<-seq(1,10)
x

x<-1:10
x

x<-seq(10,1)
x

y<-10:1
y

