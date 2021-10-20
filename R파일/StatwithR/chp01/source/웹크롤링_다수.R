#다수페이지 크롤링
library(rvest)
library(R6)

#url설정
url.page <- "https://movie.naver.com/movie/point/af/list.nhn?&page="

#시작 끝 지정
page.start<-1
page.end<-5

#페이지 리뷰 통합
review.page<-NULL

#반복
for (p in page.start:page.end) {
  
  url<-paste(url.page, seq="")
  html<-read_html(url)
  
  #리뷰 셀 추출
  review_cell<-html_nodes(html,"#old_content table td.title")
  review_cell
  
  #평점 추출
  score<-html_nodes(review_cell,"em") %>%
    html_text()
  
  #리뷰 추출
  review<-review_cell %>% html_text()
  
  #리뷰 데이터 정제
  #리뷰 앞 공통부분 위치
  index.start<-regexpr("\t별점 -",review)
  
  #리뷰 뒤 공통부분
  index.end<-regexpr("\t신고",review)
  
  #리뷰 추출
  review<- substring(review,index.start, index.end)
  review<-substring(review,16)
  #제어문자 제거 (제어문자를 공백으로 대체)
  review<-gsub("[|\n|\t]","",review)
  
  #리뷰 좌우 공백 제거
  review<-trimws(review,"both")
  
  #페이지 리뷰 저장
  review.page<-c(review.page, review)
  
}

review.page
