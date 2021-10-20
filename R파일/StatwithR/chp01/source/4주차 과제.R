library(ggplot2)

df<-data.frame(
  group = c("취침","기상 후 간단한 식사","휴식","자격증 공부&학교수업","휴식","자격증공부","저녁식사","휴식","자격증공부"),
  value = c(9,1,1,3,1.5,3.5,1,2,2))

head(df)

bp<-ggplot(df,aes(x="",y=value, fill=group))
bp
pie<-bp+coord_polar("y",start = 0)
pie

##모르겟다 포기


x<-c(9,1,1,3,1.5,3.5,1,2,2)
label<-c("취침","기상 후 간단한 식사","휴식","공부(자격증&학교수업)","휴식","자격증공부","저녁식사","휴식","자격증공부")
pie(x,labels = label, clockwise=TRUE, init.angle = 90, main = "하루일과 (20141209_채길호)")


