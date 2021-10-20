install.packages("rvest") ##웹페이지 크롤링 패키지

library(rvest)
library(R6)

#웹문서 다운
url<-"https://movie.naver.com/movie/point/af/list.nhn"
html<-read_html(url)
html

#리뷰 셀 추출
review_cell<-html_nodes(html,"#old_content table td.title")
review_cell

#평점 추출 %>% <- dplyr 패키지 chain operations[조건에 맞는 갯수 구하기]
score<-html_nodes(review_cell,"em") %>%
  html_text()
score

#리뷰 추출
review<-review_cell %>% html_text()
review

#리뷰 데이터 정제
#리뷰 앞 공통부분 위치
index.start<-regexpr("\t별점 -",review)
index.start

#리뷰 뒤 공통부분
index.end<-regexpr("\t신고",review)
index.end

#리뷰 추출
review<- substring(review,index.start, index.end)
review
review<-substring(review,16)
review

#제어문자 제거 (제어문자를 공백으로 대체)
review<-gsub("[|\n|\t]","",review)
review

#리뷰 좌우 공백 제거
review<-trimws(review,"both")
review
