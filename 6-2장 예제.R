#-----------예제1---------------------
x <- seq(from=0, to=100, by=1)
x
y <- dnorm(x, mean=50, sd=12)
y
plot(x,y,type="l")
#-----------예제2---------------------
x <- seq(from=0, to=100, by=1)
y <- dbinom(x, size=100, prob=0.5)
plot(x,y,type="l")
#-----------예제3---------------------
data <- rnorm(300, mean=70, sd=20)
Ddata <- density(data)
Ddata
plot(Ddata)
library("ggplot2")
DF <- data.frame(data)
DF
ggplot(DF, aes(x=data)) + geom_density()
library("ggthemes")
ggplot(DF,aes(x=data)) + geom_density(fill="skyblue2", colour="dodgerblue1",
alpha=0.4 + xlim(c(-10,140)) + theme_wsj()