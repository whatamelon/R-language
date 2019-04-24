#-----------------예제1-----------------

DF <- read.csv("example_studentlist.csv")
head(DF,3)

Lm = lm(height~weight, data=DF)

plot(height~weight, data=DF)
abline(Lm, col="red")

summary(Lm)

par(mfrow=c(2,2))
plot(Lm)

#-----------------예제2-----------------

DF <- read.csv("example_kbo2015_player.csv", stringsAsFactors=F, na="-")
str(DF)

DF$AVG <- as.numeric(DF$AVG) #문자열을 실수형으로 바꿈
DF$GO.AO <- as.numeric(DF$GO.AO)
DF$BB.K <- as.numeric(DF$BB.K)
DF$P.PA <- as.numeric(DF$P.PA)
DF$ISOP <- as.numeric(DF$ISOP)

Cors <- cor(DF$HR, DF[,5:length(DF)], use="pairwise.complete.obs")
Cors

Cors <- Cors[,order(Cors)]
Cors

DF$HR[DF$HR==0] <- NA
DF$AO[DF$AO==0] <- NA
DF <- na.omit(DF)

Lm <- lm(HR~AO, data=DF)
Lm

summary(Lm)

par(mfrow=c(2,2))
plot(Lm)

#-----------------예제3-----------------

head(airquality, 5)
plot(airquality)

Lm <- lm(Temp~Ozone+Solar.R+Wind, data=airquality)
Lm

summary(Lm)

#-----------------예제4-----------------

DF <- read.csv("example_kbo2015_player.csv", stringsAsFactors=F , na="-")
str(DF)

DF$AVG <- as.numeric(DF$AVG) #문자열을 실수형으로 바꿈
DF$GO.AO <- as.numeric(DF$GO.AO)
DF$BB.K <- as.numeric(DF$BB.K)
DF$P.PA <- as.numeric(DF$P.PA)
DF$ISOP <- as.numeric(DF$ISOP)

Cors <- cor(DF$HR, DF[,5:length(DF)], use="pairwise.complete.obs")
Cors

Cors <- Cors[,order(Cors)]
Cors

DF$HR[DF$HR==0] <- NA
DF$RBI[DF$RBI==0] <- NA
DF$XBH[DF$XBH==0] <- NA
DF$TB[DF$TB==0] <- NA
DF$XR[DF$XR==0] <- NA
DF$GW.RBI[DF$GW.RBI==0] <- NA
DF <- na.omit(DF)

Lm <- lm(HR~RBI+XBG+TB+XR+R, data=DF)
Lm

summary(Lm)

#-----------------예제5-----------------

DF <- mtcars
head(DF , 3)
str(DF)
Lm <- lm(mpg~wt,data=DF)
Lm

summary(Lm)

b <- predict(Lm)
b

DF$mpg[1]

b[1]

Com <- data.frame(mpg=DF$mpg, fittedMPG=b)
Com

NewCar <- data.frame(wt=6)

predict(Lm, newdata=NewCar)

NewCar2 <- data.frame(wt=0.4)
predict(Lm, newdata=NewCar2)

#-----------------예제6-----------------

library("ggplot2")
DF <- diamonds
head(DF,3)
str(DF)

Lm <- lm(price~carat, data=DF)
Lm

summary(Lm)

NewDiamond <- data.frame(carat=c(10,20))

predict(Lm, newdata=NewDiamond)