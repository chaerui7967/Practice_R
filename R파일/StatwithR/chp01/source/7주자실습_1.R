library(animation)

#숫자 출력
ani.options(interval = 1)
plot.new()
for(i in 10:0){
  rect(0,0,1,1,col = "yellow")
  size=11-i
  text(0.5,0.5,i,cex = size,col=rgb(0,0,1,1))
  ani.pause()
}

#움직이는 차트
ani.options(interval=1)

while(TRUE){
  y<-runif(5,0,1)
  barplot(y,ylim = c(0,1),col = rainbow(5))
  ani.pause()
}

#움직이는 그림 //그림 삽입
library(png)
ani.options(interval=0.5)
plot.new()
rect(0,0,1,1,col = "white")
for (i in 1:6) {
  img<-paste("C://temp/ball",i,".png",sep = "")
  img<-readPNG(img)
  rasterImage(img,0,0,1,1)
  ani.pause()
}
dev.off()
