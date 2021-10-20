#최적회귀방정식(후진제거법) - 간단예제
##dataframe 생성
x1<-c(7,1,11,11,7,11,3,1,2,21,1,11,10)
x2<-c(26,29,56,31,52,55,71,31,54,47,40,66,68)
x3<-c(6,15,8,8,6,9,17,22,18,4,23,9,8)
x4<-c(60,52,20,47,33,22,6,44,22,26,34,12,12)
y<-c(78.5,74.3,104.3,87.6,95.9,109.2,102.7,72.5,93.1,115.9,83.8,113.3,109.4)

df<-data.frame(x1,x2,x3,x4,y)

##회귀모형 생성

a<-lm(y~x1+x2+x3+x4,data = df)
summary(a)

## p값이 제일 큰 값 제외(x3)

b<-lm(y~x1+x2+x4,data = df)
summary(b)

## x4제외

c<-lm(y~x1+x2,data = df)
summary(c)

## r-value = 0.9787 , 모두 유의, 추정 회귀식= 52.57735+1.46831*x1+0.66225*x2

##cf.

###step 함수 사용-forward(전진), backward(후진), stepwise(단계적)

step(lm(y~1,data = df), scope = list(lower=~1, upper=~x1+x2+x3+x4), direction = "forward")
