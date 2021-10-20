#시계열 분석 - 영국왕 사망나이

library(tseries)
library(forecast)
library(TTR)

##분해 시계열
king<- scan("http://robjhyndman.com/tsdldata/misc/kings.dat", skip=3)
king.ts<-ts(king)
plot.ts(king.ts)

king.sma3<-SMA(king.ts,n=3) #3년 평균, 그래프를 부드럽게 표현
plot.ts(king.sma3)

king.sma8<-SMA(king.ts, n=8) #8년 평균
plot.ts(king.sma8)

##ARIMA 모델
king.ff1<-diff(king.ts, differences = 1)#1차 차분
plot.ts(king.ff1)

acf(king.ff1, lag.max = 20)
acf(king.ff1, lag.max = 20, plot = F) # lag1인 지점 빼고 모두 구간 안에 있음, acf가 lag2에서 절단점을 가짐 - MA(1) 모형

pacf(king.ff1, lag.max = 20)
pacf(king.ff1, lag.max = 20, plot = F) # lag1,2,3에서 구간을 초과, 음의값을 가짐, pacf가 lag4에서 절단점을 가짐 - AR(3) 모형

#ARMA 후보 arma(3,0), arma(0,1), arma(3,1)-혼합

##적절한 ARMA 모형 탐색

auto.arima(king) #forecast 패키지
#적절한 ARMA 모형은 0,1,1

##결과 도출
king.arima<-arima(king, order = c(0,1,1))
king.forecast<-forecast(king.arima) # h= ? 예측할 인원수, defult=10
king.forecast
