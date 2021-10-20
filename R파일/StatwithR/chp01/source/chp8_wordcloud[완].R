Sys.setenv(JAVA_HOME="C:\\Program Files\\Java\\jdk-12.0.2")
library(rJava)
library(KoNLP)
library(RColorBrewer)
library(wordcloud)

#useSejongDic() 업데이트 안돼서 사용불가
useNIADic()
#mergeUserDic(data.frame(c(""),c("")))
#buidDictionary(data.frame) ##사용불가
pal2<-brewer.pal(8,"Dark2")

te<-readLines(file.choose())
Encoding(te)="UTF-8"

noun<-sapply(te,extractNoun,USE.NAMES = F)
noun

noun2<-unlist(noun)

#단어 빼기
noun2<-gsub("여러분","",noun2)
noun2<-gsub("우리","",noun2)
noun2<-gsub("오늘","",noun2)

noun2<-Filter(function(x){nchar(x) >= 2},noun2)

word_count<-table(noun2)
word_count

head(sort(word_count,decreasing = TRUE),10)

wordcloud(names(word_count),freq = word_count,scale = c(6,0.3),min.freq = 3, random.order = F,rot.per = 1,colors = pal2 )
