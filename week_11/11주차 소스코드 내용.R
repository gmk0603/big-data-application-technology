#파이 차트 만들기
x <- c(9, 15, 20, 6)
label <- c("영업1팀", "영업2팀", "영업3팀", "영업4팀")
pie(x, labels = label, main="부서별 영업 실적")

#바차트 만들기
height <- c(9, 15, 20, 6)
name <- c("영업1팀", "영업2팀", "영업3팀", "영업4팀")
barplot(height, names.arg=name, main="부서별 영업 실적", col=rainbow(length(height)), xlab="부서", ylab="영업실적(억원)")

#워드클라우드 만들기
#워드클라우드 패키지 wordcloud
#4.0 이상은 wordcloud 하나만 설치해도 RColorBrewer가 같이 딸려옴
install.packages("wordcloud")
install.packages("RColorBrewer")
#워드클라우드 기능 불러오기
library(wordcloud)
library(RColorBrewer)
#RColor의 pal2팔레트임
pal2 <- brewer.pal(8, "Dark2")
#워드클라우드 출력할 문자열들을 숫자로 뻥튀기
x <- c("방탄소년단", "트와이스", "블랙핑크", "오마이걸", "NCT")
y <- c(7, 9, 4, 7, 23)
#워드클라우드 기능 호출
wordcloud(x, y, colors=pal2)

#파이 차트 종합
city <- c("서울", "부산", "대구", "인천", "광주", "대전", "울산")
pm25 <- c(18, 21, 21, 17, 8, 11, 25)
colors <- c("red", "orange", "yellow", "green", "lightblue", "blue", "violet")
pie(pm25, labels = city, col = colors, main="지역별 초미세먼지 농도")
pie(pm25, labels = city, col = colors, main="지역별 초미세먼지 농도", init.angle=90, clockwise = T)

#색상 체크
colors()

#팔레트
#install.packages("RColorBrewer")
library(RColorBrewer)
display.brewer.all()

display.brewer.pal(9, name='Blues')

display.brewer.pal(6, name='Greens')

#라벨 변경 및 팔레트 사용
#install.packages("RColorBrewer")
library(RColorBrewer)

greens <- brewer.pal(7, 'Greens')

pct <- round(pm25/sum(pm25)*100, 0)
city_label <- paste(city, "=", pct, "!!", sep="")

pie(pm25, labels=city_label, col=greens, main="지역별 초미세먼지 농도(완성본)", init.angle=90, clockwise=T)

#바 차트 종합
dept <- c("영업 1팀", "영업 2팀", "영업 3팀", "영업 4팀")
sales01 <- c(4, 12, 5, 8)
barplot(sales01, names.arg=dept, main="부서별 영업 실적(1분기)",
        col=rainbow(length(dept)),
        xlab="부서", ylab="영업 실적(억 원)",
        ylim=c(0, 20))

#수평선
abline(h=mean(sales01), col="orange", lty=2)
#a: y절편, b: 기울기 (y = bx + a)
abline(h=mean(sales01), col="black", lty=2)

#데이터 라벨 출력
bp <- barplot(sales01, names.arg=dept,
              col=rainbow(length(dept)),
              main="부서별 영업 실적(1분기)",
              xlab="부서", ylab="영업 실적(억 원)",
              ylim=c(0, 15))
#pos 3-> 막대 위쪽에 라벨 출력, 1-> 막대 안쪽에, 2-> 좌상단, 4-> 우상단
text(x=bp, y=sales01, labels=sales01, pos=1)  

#바 차트의 회전(수평 바 차트)
barplot(sales01, names.arg=dept,
        col=rainbow(length(dept)),
        main="부서별 영업 실적(1분기)",
        xlab="부서", ylab="영업 실적(억 원)",
        xlim=c(0, 20),
        horiz=TRUE)


#스택형 바 차트
dept <- c("영업 1팀", "영업 2팀", "영업 3팀", "영업 4팀")
sales01 <- c(4, 12, 5, 8)
sales02 <- c(12, 8, 8, 4)
#행 기준 배열 융합 sales01 + sales02 == sales
sales <- rbind(sales01, sales02)
sales

#범례 추가
legend_lbl <- c("1분기", "2분기")
barplot(sales, main="부서별 영업 실적(1~2 분기)",
        names.arg=dept,
        xlab="부서", ylab="영업 실적(억 원)",
        col = c("green", "orange"),
        legend.text = legend_lbl,
        ylim = c(0, 30),
        #레전드 위치 x = RIGHT, TOP, TOPRIGHT, TOPLEFT, BOTTOM, BOTTOMRIGHT, BOTTOMLEFT
        #ncol = 가로(2) 또는 세로(1)로 정렬
        args.legend = list(x = "top", ncol = 2))

barplot(sales, main="부서별 영업 실적(1~2 분기)", 
        names.arg=dept, 
        xlab="부서", ylab="영업 실적(억 원)", 
        col = c("green", "orange"), 
        legend.text=legend_lbl, 
        xlim= c(0, 7),
        args.legend = list(x = "right"))

#그룹형 바 차트 
barplot(sales, main="부서별 영업 실적(1~2 분기)", 
        names.arg=dept, 
        xlab="부서", ylab="영업 실적(억 원)", 
        col = c("green", "orange"), 
        legend.text=legend_lbl, 
        xlim= c(0, 17),
        args.legend = list(x = "right"),
        #둘을 분리시킴킴
        beside=TRUE)

#x-y플로팅
women

height <- women$height
weight <- women$weight
plot(x = height, y = weight,
     xlab="키", ylab="몸무게",
     main="키와 몸무게의 변화",
     #도형 출력 pch:종류 col:외부색상 
     #bg:내부색상 cex:심볼 크기를 퍼센테이정도로 크게 해라(default=1)
     pch=23, col="blue", bg="yellow", cex=1.5)

#선의 유형
plot(x = height, y = weight,
     xlab="키", ylab="몸무게",
     main="키와 몸무게의 변화",
     #type:그래프 유형 (p점, l선, b점선점선, c절취선, 
     #o점 위에 선이 지나감, h수직선, s | S:계단식, n:null값)
     #lwd:굵기, lty:선 유형 결정
     type="p")
#굵기 및 선 유형 체크
plot(height, weight,
     xlab = "키", ylab="몸무게",
     type="l", lty=2, lwd=3)

#그래프 출력 범위
plot(height, weight,
     xlim=c(0, max(height)), ylim=c(0, max(weight)),
     xlab="키", ylab="몸무게",
     main="키와 몸무게의 변화",
     pch=23, col="blue", bg="yellow", cex=1.5)

#히스토그램
#지진의 강도에 대한 히스토그램
quakes

mag <- quakes$mag
mag

hist(mag,
     main="지진 발생 강도의 분포",
     xlab="지진 강도", ylab="발생 건수",
     col=rainbow(10))

hist(mag,
     main="지진 발생 강도의 분포",
     xlab="지진 강도", ylab="발생 건수",
     col=rainbow(10),
     #어디구간부터 어디구간까지 by간격으로 출력하겠다.
     breaks=seq(4, 6.5, by=0.5))

#확률밀도 곡선
hist(mag,
     main="지진 발생 강도의 분포",
     xlab="지진 강도", ylab="발생 건수",
     col=rainbow(10),
     
     #계급의 빈도를 확률밀도로 나타냄
     #TRUE: 설정한 결과와 같은 내용 출력
     #FLASE: 확률 밀도로 나타냄
     freq=FALSE)

#그래프에 선 출력
lines(density(mag), lwd=2)

#박스 플롯
mag <- quakes$mag
boxplot(mag,
        main="지진 발생 강도의 분포",
        xlab="지진", ylab="지진 규모",
        col="red")
