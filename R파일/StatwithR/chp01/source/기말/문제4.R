library(htmlwidgets)
library(htmltools)
library(jsonlite)
library(yaml)
library(base64enc)
library(wordcloud2)
Sys.setenv(JAVA_HOME="C:\\Program Files\\Java\\jdk-12.0.2")
library(rJava)
library(KoNLP)
library(RColorBrewer)

useNIADic()
pal2<-brewer.pal(8,"Dark2")

te<-readLines(file.choose())
Encoding(te)="UTF-8"

noun<-sapply(te,extractNoun,USE.NAMES = F)
noun

noun2<-unlist(noun)

noun2<-Filter(function(x){nchar(x) >= 2},noun2)

word_count<-table(noun2)

head(sort(word_count,decreasing = TRUE),10)
wordcloud2(word_count,size = 2,shape = 'star',color = pal2,backgroundColor = "white" )
