a1<-c("0~9","10대","20대","30대")
a2<-c(142,602,3100,1194)
a3<-c(0,0,0,2)
a4<-round(a3/a2*100,2)
x<-data.frame(나이=a1, 확진자=a2,사망자=a3,치명률=a4)
x

y<-rbind(a2,a3)
legend_lbl<-c("확진자","사망자")
barplot(y,names.arg = a1,main = "확진자/사망자분포",xlab="나이",ylab="인원수(명)",col=c("blue","red"),legend.text=legend_lbl)
