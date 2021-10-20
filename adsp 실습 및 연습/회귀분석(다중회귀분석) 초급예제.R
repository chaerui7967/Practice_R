#회귀분석 예제- 자동차 가격을 엔진크기와 등등으로 비교

library(MASS)
head(Cars93)
attach(Cars93)
x<-lm(Price~EngineSize+RPM+Weight, data = Cars93)
summary(x)
