library(graphics)

height<-c(9,15,20,6) #y축
name<-c("영업1팀","영업2팀","영업3팀","영업4팀") #x축

barplot(height,names.arg = name,main = "부서별 영업 실적")


#막대 색 지정

barplot(height,names.arg = name,main = "부서별 영업 실적",col=rainbow(length(height)))

#x,y축의 라벨과 크기

barplot(height,names.arg = name,main = "부서별 영업 실적",col=rainbow(length(height)),xlab="부서",ylab="영업실적(억원)")

barplot(height,names.arg = name,main = "부서별 영업 실적",col=rainbow(length(height)),xlab="부서",ylab="영업실적(억원)",ylim=c(0,25))

#데이터 라벨 출력 p127

bp<-barplot(height,names.arg = name,main = "부서별 영업 실적",col=rainbow(length(height)),xlab="부서",ylab="영업실적(억원)",ylim=c(0,25))
text(x=bp,y=height,labels=round(height,0),pos=3)

#수평회전(가로막대)

barplot(height,names.arg = name,main = "부서별 영업 실적",col=rainbow(length(height)),xlab="영업실적(억원)",ylab="부서",horiz=TRUE,width=50)

#스택형/그룹형바
  
height1<-c(4,18,5,8)
height2<-c(9,15,20,6)

height<-rbind(height1,height2)
height

name<-c("영업1팀","영업2팀","영업3팀","영업4팀")
legend_lbl<-c("2014년","2015년")

barplot(height,names.arg = name,main = "부서별 영업 실적",col=c("darkblue","red"),legend.text=legend_lbl,xlab="부서",ylab="영업실적(억원)",ylim=c(0,35))

barplot(height,names.arg = name,main = "부서별 영업 실적",col=c("darkblue","red"),legend.text=legend_lbl,xlab="부서",ylab="영업실적(억원)",ylim=c(0,35),beside=TRUE,args.legend=list(x='top'))
