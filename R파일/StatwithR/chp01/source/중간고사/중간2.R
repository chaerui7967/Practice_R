x<-c(1.7,13.8,40.8,43,0.7)
label<-c("중국", "중국 외 아시아" ,"유럽" ,"미주" , "아프리카")
label<-paste(label,x,"%")
pie(x,init.angle = 90,labels=label,main = "해외 유입 환자 누계 현황")
