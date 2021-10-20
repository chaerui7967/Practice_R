library(wordcloud)
library(RColorBrewer)

pal2<-brewer.pal(8,"Dark2")

data<-read.csv(file.choose(),header = T)
head(data)

#"전국 지역 제외
data2<-data[data$행정구역.시군구.별 != "전국",]
head(data2)

#'구' 단위 제외
x<-grep("구$",data2$행정구역.시군구.별)
data3<-data2[-c(x)]
head(data3)

#전입자 수가 많은 지역
data4<-data3[data3$순이동.명>0]
