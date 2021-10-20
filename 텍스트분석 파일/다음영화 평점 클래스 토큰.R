html_node('p.desc_review') ## 평점 부분
html_node('em.emph_grade') ## 별점 부분

https://movie.daum.net/moviedb/grade?movieId=125080&type=netizen&page=
  
  
  for(page in 1:500){
         
           url <- paste(url_base,page,sep='',encoding="euc-kr")
           
             htxt <- read_html(url)
             table <- html_nodes(htxt,'.review_info')
             content <-html_nodes(table,'.desc_review')
             reviews <- html_text(content)
             
               starwraps <- html_node(htxt,'em.emph_grade')
             
                 score<- html_text(starwraps)
                 
                 if(length(reviews)==0){break}
                 
                   all.score <- c(all.score, score)
                   all.reviews <- c(all.reviews, reviews)
                  
                 }