# 원소의 위치에 따른 출력
x <- c(1, 2, 3, 4, 5)
x[2]

x[c(1, 3, 5)]
x[-c(2, 4)]

# 원소 값의 조건에 따른 출력
x[x > 2]

x[x >=2 & x <=4]

#원소 값의 수정
x[2] <- 20
x

x[c(3, 4)] <- 15
x

x[x <= 15] <- 10
x

# 함수를 이용한 백터 연산
x <- seq(1:10)
sum(x)

mean(x)

var(x)

sd(x)

sqrt(x)

length(x)

x <- c(1, 2, -3)
abs(x)

# 결측치 활용 예시
x <- NULL
is.null(x)

x <- 1
is.null(x)

y <- c(1, 2, 3, NA, 5)
y

# 배열
x <- array(1:3, dim=c(3))
x

x <- array(1:6, dim=c(2, 3))
x

x <- array(c(2, 4, 6, 8, 10, 12), dim=c(2, 3))
x

x[1, 3]

x[, 3]

x[,-3]

x[1, 2] <- 20
x

names <- list(c("1행", "2행"), c("1열", "2열", "3열"))

x <- array(c(2, 4, 6, 8, 10, 12), dim=c(2, 3), dimnames=names)
x

x["1행", "3열"]

# 행렬
x <- matrix(1:6, nrow=2)
x

x <- matrix(1:6, nrow=2, byrow=TRUE)
x
x[1, 3]

names <- list(c("1행", "2행"), c("1열", "2열", "3열"))

x <- matrix(1:6, nrow=2, byrow=TRUE, dimnames=names)
x

v1 <- c(1, 2, 3, 4)
v2 <- c(5, 6, 7, 8)
v3 <- c(9, 10, 11, 12)
x <- cbind(v1, v2, v3)
x

rownames(x) <- c("1행", "2행", "3행", "4행")
x

colnames(x) <- c("1열", "2열", "3열")
x

rbind(v1, v2, v3)

# 리스트
x <- list("홍길동", "2021001", 20, c("R프로그래밍", "텍스트마이닝"))
x

y <- list("성명"="정민기", "학번"="2018E7175", "나이"=24, "수강과목"=c("R프로그래밍", "텍스트마이닝"))
y

y["성명"]

y[["성명"]]

y$성명

# 데이터프레임
x <- data.frame("성명"=c("홍길동", "손오공"), "나이"=c(20, 30), "주소"=c("서울", "인천"))
x
x <- data.frame(성명=c("홍길동", "손오공"), 나이=c(20, 30), 주소=c("서울", "인천"))
x

x <- cbind(x, "학과"=c("전산학", "경영학"))
x

x <- rbind(x, data.frame("성명"="장발장", "나이"=25, "주소"="파리", "학과"="전산학"))
x

#내장 데이터셋 확인방법
library(help=datasets)

data()

quakes

head(quakes, n=10)

#986부터 1000까지 데이터 출력
tail(quakes, n=15)

#컬럼명 출력
names(quakes)

#테이블 구조 정의 확인
str(quakes)

#테이블 차원 확인
dim(quakes)

#요약 정보
summary(quakes)
summary(quakes$mag)

#테이블 생성 및 불러오기 sep=구분기호
write.table(quakes, "c:/temp/quakes.txt", sep=",")
x <- read.csv("c:/temp/quakes.txt", header=T)
x
x <- read.csv(file.choose(), header=T)
x

#https://vincentarelbundock.github.io/Rdatasets/datasets.html
url <- "https://vincentarelbundock.github.io/Rdatasets/csv/datasets/Titanic.csv"
x <- read.csv(url)
x

#키보드로부터 숫자 입력
num <- scan()

num

sum(num)

#키보드로부터 문자 입력
name <- scan(what = character())

name
