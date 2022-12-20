#네이버 영화 리뷰 크롤링 소스(R)

getwd()
setwd("c:/Rcrawl")
getwd()

install.packages("rvest")
library(rvest)

url_base <- "https://movie.naver.com/movie/point/af/list.naver?&page="
all.reviews <- c()
for(page in 1:20){ 
  url <- paste(url_base, page, sep='', Encoding="euc-kr") 
  htxt <- read_html(url) 
  table <- html_nodes(htxt, ".list_netizen") 
  content <- html_nodes(table, ".title") 
  reviews <- html_text(content) 
  if(length(reviews) == 0){break} 
  all.reviews <- c (all.reviews, reviews) 
  print(page)
}
write.table(all.reviews, 'total.txt')


# 네이버 수집 다른 방법 (일부 정제 기법 포함)
install.packages("rvest")
library(rvest)

# 웹 문서 다운 로드
url <- "https://movie.naver.com/movie/point/af/list.naver?&page="
html <- read_html(url)
html

# 리뷰 셀 추출
review_cell <- html_nodes(html, "#old_content table tr .title")
review_cell

# 평점 추출
score <- html_nodes(review_cell, "em") %>%
  html_text()
score

# 리뷰 추출 
review <- review_cell %>% 
  html_text()
review

#리뷰 데이터 정제
index.start <- regexpr("\t별점 - ", review)
index.start

index.end <- regexpr("\t신고", review)
index.end

#리뷰추출 2
review <- substring(review, index.start, index.end)
review
review <- substring(review, 16)
review

# 제어문 제거
review <- gsub("[|\n|\t]", "", review)
review

# 리뷰 좌우 공백 제거
review <- trimws(review, "both")
review

write.table(review, 'testmo.txt')

# 네이버 뉴스 크롤링(R)
# https://github.com/mrchypark/naverNewsParser

getwd()
setwd("c:/Rcrawl")
getwd()
source("getnavernews.R", encoding = "UTF-8")

#단어 단위로 문장을 분해하는 방법
mysentence <- 'Learning R is so interesting'
strsplit(mysentence, split=' ')

mysentence <- 'Learning-R-is-so-interesting'
strsplit(mysentence, split='-')

mysentence <- 'Learning_R_is_so_interesting'
strsplit(mysentence, split='_')

#문자 단위로 단어를 분해하는 방법
mywords <- strsplit(mysentence, split=' ')
mywords[[2]]
strsplit(mywords[[1]][5], split='')

#각 단어들이 각각 어떤 문자들로 구성되었는지를 표현할 경우 
#우선 5개의 하위 오브젝트를 갖는 리스트 오브젝트를 만든다. 
myletters <- list(rep(NA,5))

#myletters 오브젝트에 문자분해된 단어를 입력하였다. 
for (i in 1:5) {
myletters[i] <- strsplit(mywords[[1]][i], split='')
}
myletters

#문자들을 다시 합쳐서 단어로 구성해 보자. 
#예를 들어 myletters[[1]]에 들어있는 8개의 문자를 합쳐보자
myletters[[1]][1]
paste(myletters[[1]],collapse='')

#collapse 옵션을 다르게 사용할 수도 있다. 
paste(myletters[[1]],collapse='_')

#반복문을 이용해서 myletters에 들어있는 문자들을 합쳐 
#다시 5개의 단어들로 구성된 리스트 형식의 오브젝트를 만들어보자. 
mywords2 <- list(rep(NA,5))
for (i in 1:5) {
  mywords2[i] <- paste(myletters[[i]], collapse='')
}
mywords2

#다섯 개의 단어들을 공란을 구분해서 합치면 문장이 된다. 
paste(mywords2, collapse=' ')

#위키피디아에서 R을 설명하는 첫 두 단락을 텍스트 데이터로 입력하였다. 
R_wiki <- "R is a programming language and software environment for statistical computing and graphics supported by the R Foundation for Statistical Computing. The R language is widely used among statisticians and data miners for developing statistical software and data analysis. Polls, surveys of data miners, and studies of scholarly literature databases show that R's popularity has increased substantially in recent years.
R is a GNU package. The source code for the R software environment is written primarily in C, Fortran, and R. R is freely available under the GNU General Public License, and pre-compiled binary versions are provided for various operating systems. While R has a command line interface, there are several graphical front-ends available."

#문단단위로 구분하면 아래와 같다. 
R_wiki_para <- strsplit(R_wiki,split='\n')
R_wiki_para

R_wiki_para[[1]]
#문단단위를 문장단위로 다시 분해하면 다음과 같다. 
R_wiki_sent <- strsplit(R_wiki_para[[1]],split='\\. ')
R_wiki_sent

#문단 문장 단어단위로 분해하면 다음과 같다. 
R_wiki_word <- list(NA,NA)
for (i in 1:2) {
  R_wiki_word[[i]] <- strsplit(R_wiki_sent[[i]],split=' ')
}
R_wiki_word
R_wiki_word[[1]][[2]][3]

#regexpr은 지정된 패턴이 처음 등장하는 텍스트의 위치를 보고한다
mysentence <- "Learning R is so interesting"
regexpr('ing',mysentence)

#시작위치는 다음과 같이 하면 된다. 
loc.begin <- as.vector(regexpr('ing',mysentence))
loc.begin
#원하는 패턴의 길이는 다음과 같이 구할 수 있다. 
loc.length <- as.vector(attr(regexpr('ing',mysentence),'match.length'))
loc.length
#종료되는 위치는 다음과 같이 구하면 된다. 
loc.end <- loc.begin+loc.length-1
loc.end

#반면 gregexpr은 텍스트 데이터에서 지정된 패턴이 등장하는 모든 텍스트의 위치를 보고한다
gregexpr('ing',mysentence)

#해당 표현이 몇 번 등장했는지는 다음과 같이 확인할 수 있다. 
length(gregexpr('ing',mysentence)[[1]])

#시작위치는 다음과 같이 하면 된다. 이 때 인덱싱에 주의하기 바란다
loc.begin <- as.vector(gregexpr('ing',mysentence)[[1]])
loc.begin

#원하는 패턴의 길이를 구할 때도 인덱싱 주의
loc.length <- as.vector(attr(gregexpr('ing',mysentence)[[1]],'match.length'))
loc.length

#종료되는 위치는 다음과 같이 구하면 된다. 
loc.end <- loc.begin+loc.length-1
loc.end

#regexec는 regexpr과 비슷해 보이지만, 동일하지는 않다. 
#일단 간단한 표현을 쓸 경우 regexec와 regexpr는 거의 동일하다. 
regexpr('interesting',mysentence)

#다음과 같이 하면 보다 간단할 수도 있다. 
regexec('interestin(g)',mysentence)

#원하는 부분이 3개 이상일 경우에는 더 유용할 수 있다. 
regexec('so (interestin(g))',mysentence)

#위의 함수들은 텍스트 데이터에서 원하는 부분이 어디에서 나타나는지를 인덱싱하는 역할을 한다. 
#이 부분과 관련해서는 regmatches 함수와 substr 함수 부분에서 다시 설명하겠지만, 
#조합을 어떻게 하는가에 따라 매우 유용하게 사용가능하다. 간단한 한 가지 사례만 살펴보기 바란다. 
#software라는 단어가 앞서 소개한 위키피디아의 R 소개글의 7개 문장 중 어디에서 등장하는지, 
#그리고 어떤 위치에서 등장하는지를 살펴보자. 
mysentences <- unlist(R_wiki_sent)
regexpr("software",mysentences)

#2회이상 등장여부를 확인하는 방법은 아래와 같다. 
gregexpr("software",mysentences)

#시작과 종료위치를 정리하는 방법
mytemp <- regexpr("software",mysentences)
#시작위치를 추출한 후, 해당 표현이 나오지 않은 경우 결측값으로 처리하였다. 
my.begin <- as.vector(mytemp)
my.begin[my.begin == -1] <- NA 
#종료위치를 계산하였다. 
my.end <- my.begin + as.vector(attr(mytemp,"match.length")) - 1
#시작과 종료위치를 문장의 수만큼 확정할 수 있는 행렬 데이터를 만들었다. 
mylocs <- matrix(NA,nrow=length(my.begin),ncol=2)
colnames(mylocs) <- c('begin','end')
rownames(mylocs) <- paste('sentence',1:length(my.begin),sep='.')
#반복계산을 통해 정리하였다. 
for (i in 1:length(my.begin)) {
mylocs[i,] <- cbind(my.begin[i],my.end[i])
}
mylocs

#아래와 같이 해당 표현이 등장하는지 여부를 확인할 수 있다. 
grep('software',mysentences)
grepl('software',mysentences)

#sub함수의 경우 처음에 등장한 표현만을, gsub는 모든 표현을 교체한다. 
sub('ing','ING',mysentence)
gsub('ing','ING',mysentence)
gsub('so', '', mysentence)
