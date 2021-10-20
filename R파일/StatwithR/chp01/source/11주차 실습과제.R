install.packages("htmlwidgets","htmltools","jsonlite","yaml","base64enc")
#위 패키지 다운받아야 사용가능
install.packages("wordcloud2")
library(htmlwidgets)
library(htmltools)
library(jsonlite)
library(yaml)
library(base64enc)
library(wordcloud2)


#useSejongDic() 업데이트 안돼서 사용불가
useNIADic()
pal2<-brewer.pal(8,"Dark2")

te<-readLines(file.choose())
Encoding(te)="UTF-8"
te
