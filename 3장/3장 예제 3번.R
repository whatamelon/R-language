install.packages("data.table")
library("data.table")
librara("ggplot2")

DF<-fread("example_coffee.csv",header=T,stringsAsFactors=T,data.table=F)

str(DF)

DF<-subset(DF,select=c(-adress,-adressBystreet,-dateOfclosure,-startdateOfcessation,-duedateOfcessation,-dateOfreOpen,-zip))

range(DF$yearOfStart, na.rm=T)

DFFilter <- subset(DF, subset=(stateOfbusiness=="¿î¿µÁß"))
range(DFFilter$yearOfStart,na.rm=T)
subset(DFFilter,subset=(yearOfStart==1967))

table(DF$yearOfStart)

library("ggplot2")
qplot(yearOfStart, data=DF, geom="bar")

Freq <- table(DF$stateOfbusiness, DF$yearOfStart)
Freq

which(colnames(Freq)=="1997")
which.max(colnames(Freq))
Freq <- Freq[,c(30:47)]
PFreq <- prop.table(Freq,margin=2)
PFreq

NewDF <-data.frame(colnames(Freq),Freq[2,],PFreq[1,],PFreq[2,])
NewDF

rownames(NewDF) <- NULL
colnames(NewDF) <- c("Time","Open","Close","POpen","Pclose")
NewDF

ggplot(NewDF,aes(x=factor(Time),y=Close,group=1))+
geom_line(colour="steelblue1",size=1)+
geom_point(colour="steelblue",size=3)+
geom_line(aes(y=Open),colour="tomato2",size=1)+
geom_point(aes(y=Open),colour="red",size=6)+
theme_bw()