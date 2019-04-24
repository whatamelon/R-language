library("data.table")

Size[Size > 10000] <-NA
summary(Size)

Size[Size==0] <- NA
Size <- Size[complete.cases(Size)]
summary(Size)

DegreeOfSize <- table(cut(Size,breaks=(0:72)*20))
DegreeOfSize

library("ggplot2")
library("ggthemes")
ggplot(data=DF,aes(x=sizeOfsite))+
geom_freqpoly(binwidth=10,size=1.2,colour="orange")+
scale_x_continuous(limits=c(0,300),breaks=seq(0,300,20))+
theme_wsj()

DF <- read.csv("example_population.csv",stringsAsFactors=F)
str(DF)

head(DF,5)

install.packages("stringr")

library("stringr")

temp <- str_split_fixed(DF[,1],"\\(",2)

head (temp,10)

NewCity <- str_split_fixed(temp[,1],"",2)
head(NewCity,10)

colnames(NewCity) <- c("Provinces","City")
DF <- data.frame(NewCity, DF[,c(2:7)])
head(DF,3)

DF[DF==" "] <- NA
head(DF,10)

DF <- DF[complete.cases(DF),]
head(DF,10)

for(i in 3:8) {
DF[,i] <- sapply(DF[,i], function(x) gsub(",","",x))
DF[,i] <- as.numeric(DF[,i])
}
str(DF)

ProPopul <- tapply(DF$Population, DF$Provinces,sum)
ProPopul

DF[,1] <- factor(DF[,1])
ProPopul <- tapply(DF$Population, DF$Provinces, sum)
ProPopul

library("ggplot2")
library("ggthemes")
Graph <- ggplot(DF, aes(x=Provinces, y=Population,fill=Provinces)) + geom_bar(stat="identity")
Graph


