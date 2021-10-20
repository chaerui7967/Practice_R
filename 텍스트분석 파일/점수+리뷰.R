##영화평점 리뷰 크롤링

library(rvest)
library(httr)
library(stringr)
library(tm)
library(xml2)
url_base <- 'http://movie.daum.net/moviedb/grade?movieId=99056&type=netizen&page='   

all.reviews <- c()
all.score <- c()

 for(page in 1:500){   
     url <- paste(url_base, page, sep='')   
     htxt <- read_html(url)                  
            comments <- html_nodes(htxt, 'div') %>% html_nodes('p')
            stars <- html_nodes(htxt,'em.emph_grade')
            score<- html_text(stars)
            
              reviews <- html_text(comments)
              reviews <- repair_encoding(reviews, from = 'utf-8') 
              
                if( length(reviews) == 0 ){ break }                              
              reviews <- str_trim(reviews)
              
                all.reviews <- c(all.reviews, reviews) 
                all.score <- c(all.score, score)
                
 }

all.reviews <- all.reviews[!str_detect(all.reviews,"평점")]
temp<-cbind(all.score,all.reviews)

write.table(temp,"qerqwer.txt")

