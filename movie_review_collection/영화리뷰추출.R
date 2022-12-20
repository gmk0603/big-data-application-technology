#패키지 설치
install.packages("rvest")
library(rvest)

#URL 설정
url.page <- "https://movie.naver.com/movie/point/af/list.naver?st=mcode&sword=184516&target=after&page="

#시작과 끝 페이지
page.start <- 1
page.end <- 834

#페이지별 리뷰 통합
review.page <- NULL

for(p in page.start:page.end){
  
  #페이지 URL 설정
  url <- paste(url.page, p, sep="")
  
  #웹문서 읽기
  html <- read_html(url)
  html
  
  #리뷰 셀 추출
  review_cell <- html_nodes(html, "#old_content table tr .title")
  review_cell
  
  #평점 추출
  score <- html_nodes(review_cell, "em") %>%
    html_text()
  score
  
  #리뷰 추출
  review <- review_cell %>%
    html_text()
  review
  
  #리뷰 데이터 정제
  #(1) 리뷰 부분 추출 색인
  index.start <- regexpr("\t별점 - ", review)
  index.start
  index.end <- regexpr("\t신고", review)
  index.end
  #(2) 리뷰 추출
  review <- substring(review, index.start, index.end)
  review
  review <- substring(review, 16)
  review
  #(3) 제어문자 제거
  review <- gsub("[|\n|\t]", "", review)
  review
  #(4) 리뷰 좌우 공백 제거
  review <- trimws(review, "both")
  review
  #각 페이지 리뷰 저장
  review.page <- c(review.page, review)
}

review.page
getwd()
write.table(review.page, 'movie_review.txt')
