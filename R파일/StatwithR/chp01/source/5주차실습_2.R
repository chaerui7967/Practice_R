#x-y플로팅

women
weight<-women$weight
plot(weight)

#플로팅 문자 출력

height<-women$height
plot(height,weight,xlab = "키",ylab="몸무게",pch=23,col="blue",bg="yellow",cex=1.5,type="o")

#히스토그램
head(quakes)

mag<-quakes$mag
mag
hist(mag,main = "지진 발생 강도의 분포",xlab="지진강도",ylab="발생건수")

#계급구간 색
colors<-c("red","orange","yellow","green","blue","navy","violet")

hist(mag,main = "지진 발생 강도의 분포",xlab="지진강도",ylab="발생건수",col=colors,breaks=seq(4,6.5,by=0.5),freq=FALSE)
lines(density(mag))

#박스 플롯

mag<-quakes$mag

min(mag)
max(mag)
median(mag)
quantile(mag,c(0.25,0.5,0.75))
boxplot(mag,main="지진 발생 강도의 분포",xlab="지진",ylab="발생건수",col="red")
