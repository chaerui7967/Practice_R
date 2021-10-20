#데이터 소스 위치
url<-"http://raw.githubusercontent.com/cran/BTYD/master/data/cdnowElog.csv"

#데이터 읽기
data<-read.csv(url,header = T)

#헤더 부분 출력
head(data)

#거래량
quantity<-data$cds

#거래량 이원 분류표(거개량 대 빈도수)
table(quantity)

#히스토 그램으로 출력
hist(quantity,main = "거래량 분포",xlab="주문당 거래량",ylab="빈도수")

colors<-c("red","orange","yellow","green","blue","navy","violet")
hist(quantity,main = "거래량 분포",xlab="주문당 거래량",ylab="빈도수",col=colors, breaks="Sturges",freq=FALSE)
