#다차원 척도법(MDS) - 유클리드 거리 계산이용
##계량적 다차원척도법 - 유럽도시 거리 측정
library(MASS)
loc<- cmdscale(eurodist)
x<-loc[,1]
y<-loc[,2]

plot(x,y, type = "n", asp=1, main="Metric MDS")
text(x,y, rownames(loc), cex = 0.7) #text 삽입
abline(v=0, h=0, lty=2, lwd=0.5) #기준선 작성

##비계량적 MDS - 스위스 토양 비옥도 지수등 측정
library(MASS)
data(swiss)
swiss.x<- as.matrix(swiss[,-1])
swiss.dist<- dist(swiss.x)
swiss.mds<-isoMDS(swiss.dist)
plot(swiss.mds$points, type = "n")
text(swiss.mds$points, labels = as.character(1:nrow(swiss.x)))
abline(v=0,h=0, lty=2, lwd=0.5)

##비계량적 MDS- sammon
siwss.x<-as.matrix(swiss[,-1])
swiss.sammon<- sammon(dist(swiss.x))
plot(swiss.sammon$points, type = "n")
text(swiss.sammon$points, labels = as.character(1:nrow(swiss.x)))
abline(v=0,h=0, lty=2, lwd=0.5)
