#회귀분석 초급예제 - 10년간 에어컨 예약대수(X)와 판매대수(Y)

x<-c(19,23,26,29,30,38,39,46,49)
y<-c(33,51,40,49,50,69,70,64,89)

lm(y~x)

summary(lm(y~x))
