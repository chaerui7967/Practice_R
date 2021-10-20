#파이차트
x<-c(9,15,20,6)
name<-c("1팀","2팀","3팀","4팀")
pie(x,labels=name,main = "부서별 영업실적")

#바차트
barplot(x,names.arg = name,main = "부서별 영업실적",col=rainbow(length(x)),xlab="부서",ylab="영업실적(억원)")

#카운트다운
install.packages("animation")
library(animation)

ani.options(interval = 1)
plot.new()

for (i in 10:0) {
  rect(0,0,1,1,col = "yellow")
  text(0.5,0.5,i,cex = 5,col = rgb(.2,.2,.2,.7))
  ani.pause()
}

#워드 클라우드 출력
install.packages("wordcloud")
install.packages("RColorBrewer")

library(wordcloud)
library(RColorBrewer)

pal2<-brewer.pal(8,"Dark2")

x<-c("국민","신한국사회","민족")
y<-c(5,4,3)

wordcloud(x,y,colors = pal2)

#시뮬레이션
iteration<-5000

plot(0,0,xlab = "던진횟수", ylab="앞면 비율",xlim=c(0,iteration),ylim=c(0,1))

abline(a=0.5,b=0,col="red")
sum<-0

for(x in 1:iteration){
  y<-sample(c("앞","뒤"),1,replace=T)
  if(y=="앞"){
    sum=sum+1
  }
  prob<-sum/x
  points(x,prob)
}