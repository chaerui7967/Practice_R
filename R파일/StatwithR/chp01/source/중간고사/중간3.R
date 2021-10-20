library(wordcloud)
library(RColorBrewer)

pal1<-brewer.pal(8,"Dark2")
label<-c("중국", "중국 외 아시아" ,"유럽" ,"미주" , "아프리카")
x<-c(1.7,13.8,40.8,43,0.7)

wordcloud(label,x, colors = pal1)
