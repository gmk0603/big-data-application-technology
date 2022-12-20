# 1.기본 package 설정

## 1.1 package 설치

## 1.1.1 jdk 설치
install.packages("rJava")
install.packages("multilinguer")

library(rJava)
library(multilinguer)
install_jdk()

## 1.1.2 KoNLP 설치(github이용)
install.packages(c("remotes"))
remotes::install_github('haven-jeon/KoNLP', 
                        upgrade = "never", 
                        INSTALL_opts=c("--no-multiarch"))

## 1.1.3 KoNOP 로드
library(KoNLP)

useNIADic() # 단어사전 사용 - 
useSejongDic()

extractNoun("나는 학생이며 오늘도 공부를 합니다.")
MorphAnalyzer("나는 안양대학교 학생이며 오늘도 빅데이터를 공부합니다.")

install.packages("wordcloud")
library(wordcloud)

word <- c("인천광역시", "강화군", "웅진군")
frequency <- c(651, 85, 61)

wordcloud(word, frequency, colors="blue")

getwd()
setwd("C:/Users/USER/Documents")
dir()

library(wordcloud)
library(RColorBrewer)
pal2 <- brewer.pal(8,"Dark2")

data <- read.csv(file.choose(), header=T, fileEncoding = "euc-kr")
head(data)

data2 <- data[data$행정구역.시군구.별!="전국",]
head(data2)

x <- grep("구$",data2$행정구역.시군구.별) 
data3 <- data2[-c(x), ] 
head(data3)

data4 <- data3[data3$순이동.명>0, ] 
word <- data4$행정구역.시군구.별 
frequency <- data4$순이동.명 
wordcloud(word, frequency, colors=pal2)
