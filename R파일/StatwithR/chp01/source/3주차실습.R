seq(1,5,2)
seq(1,5,by=2)
seq(1,10,2,5)
seq(1,10,length.out = 10)
x<-c(1,2,3)
rep(x,2)
rep(x,time(2))
rep(x,times=2)
rep(x,each=2)
x<-c(1,2,3,4,5)
x[2]
x[c(1,3,5)]
x[-c(1,5)]
x[x>2]
x[x>=2&x<=4]


#통계적활용
x<-seq(1:10)
mean(x)
var(x)
sd(x) #표준편차
abs(x) #절대값
sqrt(x) #제곱근
length(x) #원소 개수

#배열활용
x<-array(1:6,dim = c(2,3)) #2행 3열 배열 생성
x
x[1,3] #x의 1행 3열 값
x[,3] #x의 3열의 모든값
names<- list(c("1행","2행"),c("1열","2열","3열")) #열이름 삽입
x<-array(1:6,dim = c(2,3),dimnames = names)
x
y<-array(1:24,dim = c(2,3,4)) #3차원 배열생성
y

#행렬활용
x<-matrix(1:6,nrow = 3)
x

x<-matrix(1:6,nrow = 2,byrow = TRUE)
x

matrix(1:6,nrow = 2,byrow = TRUE,dimnames = names)

#벡터결합 cbind, rbind
v1<-c(1,2,3,4)
v2<-c(5,6,7,8)
v3<-c(9,10,11,12)

w<-cbind(v1,v2,v3)
w

w<-rbind(v1,v2,v3)
w

#리스트 활용
x<-list("ㅡㅡㅡ","201230123",20,c("백수","백수"))
x

x<-list("성명"="ㅡㅡㅡ","학번"="201230123","나이"=20,"과목"=c("백수","백수"))
x

#데이터 프레임 활용 rbind, cbind 활용법법
x<-data.frame(성명=c("홍길동","손오공"),나이=c(20,30),주소=c("서울","부산"))
x
x<-cbind(x,학과=c("전산학","경영학"))
x
x<-rbind(x,data.frame(성명="ㅡㅡㅡ",나이=25,주소="파파",학과=",,,,"))
x

#데이터 파일 가져오기
library(help="datasets")

quakes
head(quakes,n=10) #앞 10개
tail(quakes,n=6) #뒤 6개
names(quakes) #데이터세트의 변수명
str(quakes) #데이터 유형
dim(quakes) #배열의 형태 1000행 5열
summary(quakes) #요약 4분위수
summary(quakes$mag)

#데이터 저장, 읽기
write.table(quakes, "c:/temp/quakes.txt", sep=",")
x<-read.csv("c:/temp/quakes.txt", header = T)
x
