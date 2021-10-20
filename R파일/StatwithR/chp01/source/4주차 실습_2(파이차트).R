#파이차트
x<-c(9,15,20,6)
label<-c("영업1팀","영업2팀","영업3팀","영업4팀")
pie(x,labels = label,main = "부서별 영업실적")

#기준선 변경 init.angle= 90(12시방향부터 시작)
pie(x,init.angle = 90,labels = label,main = "부서별 영업실적")

#색, 라벨 수정, clockwise=true(시계방향)
pct<-round(x/sum(x)*100)
label<-paste(label,pct)
label<-paste(label,"%",sep = "")
pie(x,clockwise=TRUE, init.angle = 90, col=rainbow(length(x)), labels = label,main = "부서별 영업실적")

#3d 파이차트
install.packages("plotrix")
library(plotrix)
pie3D(x,labels = label,explode=0.1, labelcex=0.8,main = "부서별 영업실적")
