#-------------예제1---------------

lm(mpg~hp,data=mtcars)

DF <- data.frame(Work_hour=1:7, Total_pay=seq(10000, 70000, by=10000))

plot(Total_pay~Work_hour, data=DF, pch=20, col="red")
grid()

LR <- lm(Total_pay ~ Work_hour, data=DF)
LR

mode(LR)

abline(LR, col="blue", lwd=2)

#-------------예제2---------------

DF <- read.csv("example_kbo2015.csv")
str(DF)

DF$H
DF$HR
cor(DF$H, DF$HR)

plot(HR~H, data=DF, pch=20, col="grey", cex=1.5)

Lm <- lm(HR~H, data=DF)
Lm

abline(Lm, lwd=2, col="red")

#-------------mtcars---------------

mtcars
str(mtcars)
cor(mtcars$hp, mtcars$mpg)

plot(mpg~hp, data=mtcars)
Lm <- lm(mpg~hp, data=mtcars)
abline(Lm, col="red")

Lm