install.packages("animation")
library(animation)

ani.options(interval = 1)
plot.new()

for(i in 10:0){
  
  rect(0, 0, 1, 1, col="yellow")
  
  text_size = 11-i
  textname = 10-i
  text(0.5, 0.5, textname, cex=text_size, col=rgb(0, 0, 1, 1))
  
  ani.pause()
}

sum <- 0
for(i in 1:10){
  sum <- sum + i
}
print(sum)

sum <- 0
i <- 1
while( i <= 10){
  sum <- sum + i
  #print(sum)
  i <- i + 1
  print(i)
}
print(sum)

#######################################
########텍스트 데이터 처리#############
# 텍스트 분석을 위한 기초적 R 함수들#
#######################################

#리스트와 벡터의 구분
myvector <- c(1:6,'a')
myvector

mylist <- list(1:6,'a')
mylist

#list 형식의 오브젝트 소개
obj1 <- 1:4
obj2 <- 6:10
#간단한 리스트 형식의 오브젝트는 다음과 같다. 
obj3 <- list(obj1,obj2)
obj3

#list함수는 연이어 사용할 수도 있다. 
mylist <- list(obj1,obj2,obj3)
mylist

#벡터로 구성된 자료의 경우 []를 사용하지만, 리스트형식은 [[]]을 사용한다
#예를 들어 아래와 같이 []을 사용하면 리스트를, [[]]을 사용하면 벡터를 얻을 수 있다. 
mylist[[3]][1]
mylist[[3]][[1]]

#[[]]와 []에 익숙해지면 아래의 표현도 이해할 수 있다. 
mylist[[3]][[1]][2]

#unlist함수는 리스트를 벡터형식으로 돌려주는 역할이다. #unlist 함수는 유용하지만 조심하여 사용하기 바란다.
myvector <- c(1:6,'a')
myvector
mylist <- list(1:6,'a')
mylist
mylist[[1]][5]
mylist[[1]]
mylist[1]
unlist(mylist)
unlist(mylist) == myvector

#예를 들어 mylist의 모든 관측값의 평균을 구한다고 가정하자.
mylist[[1]]
mylist[[1]][1:6]
mylist[1]
mean(mylist[1])
mean(unlist(mylist)[1:6])

#텍스트형 자료(문자에서 단어로)
name1 <- "Donald"
myspace <- " " 
name2 <- "Trump"
presid <- list(name1, myspace, name2)
presid[1]
presid[[1]]
presid[2]
presid[[2]][[1]]
unpresid <- unlist(list(name1, myspace, name2))
unpresid[[2]][2]
#2차시 시작
#오브젝트의 속성이 입력된 경우가 많으며, 상황에 따라 속성값을 저장할 필요가 있다
name <- c('갑','을','병','정')
gender <- c(2,1,1,2)
mydata <- data.frame(name,gender)
mydata
attr(mydata$name,"what the variable means") <- "응답자의 이름" 
mydata$name

#리스트 형식인 경우 lapply 함수가 매우 유용하다. 
mylist <- list(1:4,6:10,list(1:4,6:10))
mylist
mylist[[3]]
lapply(mylist[[3]],mean)

#sapply 함수의 경우 lapply 함수 결과와 유사하지만 결과값에 unlist 함수를 적용한다는 점이 다르다
sapply(mylist[c(1,2,c(1,2))],sum)
unlist(lapply(mylist[c(1,2,c(1,2))],sum))

#tapply는 텍스트 데이터에서 종종 사용된다. #다음과 같은 빈도표 2개를 가정해 보자. 
wordlist <- c("the","is","a","the")
doc1freq <- c(3,4,2,4)
doc2freq <- rep(1,4)
#아래의 사례를 보면 tapply() 함수가 어떤 역할을 하는지 알 수 있다.
tapply(doc1freq,wordlist,sum)
tapply(doc2freq,wordlist,sum)


####################################### 
# 텍스트 데이터 처리############# 
# 텍스트 분석을 위한 R의 베이스 함수#
#######################################
#알파벳 출력 함수 
letters[26]
LETTERS[26]
letters[3:10]
LETTERS[3:10]
LETTERS[1:26]

tolower("Eye for eye")
toupper("Eye for eye")

#nchar() 함수의 디폴트는 문자수를 세는 것이다. 
nchar('Korea') 
nchar('Korea',type='bytes') 
nchar('대한민국') 
nchar('대한민국 ',type='bytes')


#공란이 있으면 다르게 취급된다. 
nchar('Korea')
nchar('Korea ')

#스페이스로 표현된 공란이 아니라 탭(tab)으로 구분된 공란일 경우는 
#\t으로 표현하며, 이 때는 2개의 문자수가 아니라 1개의 문자수를 갖는다. 
nchar('Korea\tH')
nchar('Korea\tH',type='bytes') 

#줄바꾸기를 했을 경우 \n으로 표현한다. 마찬가지로 1개의 문자수를 갖는다. 
nchar('Korea, Republic of')
nchar('Korea,
Republic of')

#다음과 같이 하면 줄바꾸기가 된 형태로 인식된다. 
nchar('Korea, \nRepublic of')

# 패키지 설치
install.packages("rvest")
library(rvest)

# 타겟 저장
url <- "https://www.data.go.kr/tcs/dss/selectDataSetList.do"
html <- read_html(url)
html
# 제목 불러오기
title <- html_nodes(html, "#apiDataList .title") %>%
  html_text()
title
# 내용 불러오기
desc <- html_nodes(html, "#apiDataList .ellipsis") %>%
  html_text()
desc

# 불용용어 제거
title <- gsub("[|\r|\n|\t]", "", title)
title

# 클래스가 ellipsis인 클래스 내 불용용어 제거
desc <- gsub("[|\r|\n|\t]", "", desc)
desc

# 출력
api <- data.frame(title, desc)
api
