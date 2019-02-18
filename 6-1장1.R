#-----------예제1-----------------------
install.packages("gtools")
library("gtools")
name <- c("A","B","C")
permutations(3,2,name)
permutations(3,2,name,repeats.allowed=T)
nrow(permutations(3,2,repeats.allowed=T))
combinations(3,2,name)
combinations(3,2,name,repeats.allowed=T)
#-----------예제2------------------------
dbinom(9,10000,0.0009)
a <- dgeom(1:10, 0.2) # 기하분포 함수 dgeom
a
sum(a[1:5])

#--------난수값 생성하기-------------------
runif(10)
runif(50, min=0, max=100)
rnorm(10, mean=100, sd=15)
rnorm(1000,mean=452, sd=80)

#---------이항분포 난수 생성하기------------
rbinom(100, size=1, prob=0.5)
rbinom(100, size=1, prob=1/6)
a <- rbinom(100, size=1, prob=1/6)
a[a==1] <- "성공"
a[a==0] <- "실패"
a

#----------확률 계산하기---------------
dnorm(15, mean=30, sd=7)
dnorm(450, mean=550, sd=80)
dbinom(50, size=1020, prob=0.25)
dgeom(3, prob=0.2)
pgeom(3, prob=0.2)

#----------구간확률 계산하기-----------
pnorm(235, mean=240, sd=80)
pnorm(370, mean=350, sd=75) - pnorm(200, mean=350, sd=75)
diff(pnorm(c(200,370), mean=350, sd=75))

#------확률질량함수 구간확률 구하기------
pbinom(900, size=2000, prob=0.5)
pbinom(1550, size=2000, prob=0.78)
pbinom(1500, size=2000, prob=0.78) - pbinom(300, size=2000, prob=0.78)
diff(pbinom(c(300,1500), size=2000, prob=0.78))

