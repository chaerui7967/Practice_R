for (page in 1:500) {
  url <- paste(url_base,page, sep = '')
  htxt <- read_html(url)
  comments <- html_nodes(htxt, 'div') %>% html_nodes('p')
  reviews <- html_text(comments)
  reviews <- repair_encoding(reviews, from = 'utf-8')
  if( length(reviews) == 0 ){ break }
  reviews <- str_trim(reviews)
  all.reviews <- c(all.reviews, reviews)
  print(page)
}
all.reviews <- all.reviews[!str_detect(all.reviews,"?‰? ")]
ko.words <- function(doc){
  
  d <- as.character(doc)
  
  pos <- paste(SimplePos09(d))
  
  extracted <- str_match(pos, '([ê°€-?ž£]+)/[NP]')
  
  keyword <- extracted[,2]
  
  keyword[!is.na(keyword)]
  
}

tdm <- TermDocumentMatrix(cps,   
                          
                          control=list(tokenize=ko.words,   
                                       
                                       removePunctuation=T,
                                       
                                       removeNumbers=T,
                                       
                                       wordLengths=c(2, 6),  
                                       
                                       weighting=weightBin
                                       
                          ))




