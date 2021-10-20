#주성분 분석 - USArrests
library(datasets)
data(USArrests)
pairs(USArrests, panel = panel.smooth, main="USArrests data")

US.prin<- princomp(USArrests, cor=T)
summary(US.prin) #Cumulative 확인
screeplot(US.prin, npcs = 4, type = "lines") #그래프

loadings(US.prin) #각 주성분 기여 가중치 확인

US.prin$scores

arrests.pca<-prcomp(USArrests, center = T, scale. = T) #결과 도출 각 범죄별 발생빈도?
biplot(arrests.pca) #결과 그래프-빨간색 선에 가까울 수록 해당 선의 범죄율이 높음음
