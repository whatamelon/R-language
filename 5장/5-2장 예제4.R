# ------------------예제4-------------

library("dplyr")
library("ggplot2")
library("ggthemes")

DF <- read.csv("example_population_f.csv")
DF <- DF[,-1] # 첫 번째 열은 숫자이기 때문에 삭제함
DF <- tbl_df(DF) #dplyr에서 데이터프레임을 다룰 수 있도록 변환
DF

DF2 <- filter(DF,Provinces="충청북도"|Provinces=="충청남도")

Graph <- ggplot(DF2, aes(x=City, y=Population,
fill=Provinces)) + geom_bar(stat="identity") + theme_wsj()
Graph

GraphReorder <- ggplot(DF2, aes(x=reorder(City,Population),
y=Population, fill=Provinces)) + geom_bar(stat="identity") + theme_wsj()
GraphReorder

DF3 <- filter(DF, SexRatio > 1, PersInHou < 2)

Graph <- ggplot(DF3, aes(x=City, y=SexRatio, fill=Provinces)) +
geom_bar(stat="identity") + theme_wsj()
Graph

library("dplyr")
library("ggplot2")
library("ggthemes")

DF <- read.csv("example_population_f.csv")
DF <- DF[,-1] #불필요한 첫 번째 열은 삭제함

DF <- mutate(DF, SexF = ifelse(SexRatio < 1, "여자비율높음",
ifelse(SexRatio > 1, "남자비율높음", "남여비율같음")))

DF$SexF <- factor(DF$SexF)
DF$SexF <- ordered(DF$SexF, c("여자비율높음","남여비율같음","남자비율높음"))

DF2 <- filter(DF, Provinces=="경기도")

Graph <- ggplot(DF2, aes(x=City, y=(SexRatio-1), fill=SexF)) +
geom_bar(stat="identity",position="identity") + theme_wsj()
Graph

DF4 <- filter(DF, Provinces=="서울특별시")

Graph2 <- ggplot(DF4, aes(x=City, y=SexRatio-1), fill=SexF)) +
geom_bar(stat='identity',position='identity')+theme_wsj()
Graph2