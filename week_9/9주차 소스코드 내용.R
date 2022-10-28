2+3
X <- 3
X+5
X-1
X*4
8/2
X**3
2^4
X^3
10%%3
10%/%3
X < 10
X < 2
X <= 10
X >= 3
X == 10
X == 3
X != 10
X != 3
# 다른 비교연산
X <- 5<3
X
y <- c(10, 20, 30)
z <- y<=10
z
# 서로 다른 데이터 유형
X <- c(1, 2, 3)
y <- c("A", "B", "C")
y
y <- c("A", 1, 2)
y
z <- y+1
y <- 3
z <- y+1
z
# 벡터와 사칙연산
x <- c(1, 2, 3, 4)
y <- c(2, 3, 4, 5)
z <- c(1, 2)
w <- x+y
w
w <- x+5
w
w <- y/2
w
w <- x+z
w
# 논리 연산자
x <- TRUE
y <- FALSE
x|y
x <- FALSE
y <- TRUE
x|y
x <- FALSE
y <- FALSE
x|y
x <- TRUE
y <- TRUE
x&y
x <- TRUE
!x
x <- FALSE
!x
x <- TRUE
isTRUE(x)
# 벡터 생성 함수
x <- seq(1, 10, by=4)
x
x <- 21:30
x
y <- 10:1
y
#벡터 생성 함수 rep
x <- c(1, 2, 3)
rep(x, times=2)
rep(x, each=3)
y <- seq(1, 10, length.out=5)
y
x <- c(11, 22, 33, 44, 55)
x[2]
x[c(1,3,5)]
x[-c(2,4)]
x[x>20]
x[x>=20 & x<=40]
x[2] <- 99
x[2]
x[x<40] <- 88
x
