library(wordcloud)

word<-c("인천광역시","강화군","옹진군")
frequency<-c(651,85,61)

wordcloud(word,frequency,colors = "blue")

wordcloud(word,frequency,random.color = F,random.order = F,colors = rainbow(length(word)))


#팔레트 패키지 활용
library(RColorBrewer)

pal2<-brewer.pal(8,"Dark2")

wordcloud(word,frequency,colors = pal2)

display.brewer.all()
