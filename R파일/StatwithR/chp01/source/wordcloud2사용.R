#github로 다운
install.packages("devtools") ##github 오픈 소스 사용가능
library(devtools)
devtools::install_github("lchiffon/wordcloud2") ##github에서 워드클라우드 다운 (오류확률 낮아짐)

#정석
install.packages("htmlwidgets","htmltools","jsonlite","yaml","base64enc")

#위 패키지 다운받아야 사용가능
install.packages("wordcloud2")

#임포트 클래스
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

#useSejongDic() 업데이트 안돼서 사용불가
useNIADic()
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
wordcloud2(word_count,size = 2,shape = 'star',color = pal2,backgroundColor = "white" )
#shape = circle(default), diamond, triangle-forward,triangle, pentagon, star

#연습 데이터 간단
tex<-data.frame(c("시험","잘","보세","요"),c(25,20,15,10))
wordcloud2(tex)
