# ------------------예제6--------------

library("dplyr")
library("ggplot2")
library("ggthemes")

DF <- read.csv('example_population_f.csv')
DF <- DF[,-1]
DF <- tbl_df(DF)

DF2 <- mutate(DF, SexF=ifelse(SexRatio > 1, "남자비율높음",
ifelse(SexRatio == 1, "남녀비율같음","여자비율높음")))

DF3 <- filter(DF2, Provinces =="경기도")

Graph <- ggplot(DF3, aes(x=(SexRatio-1), y=reorder(City, SexRatio))) +
geom_segment(aes(yend=City), xend=0, colour="grey50") + geom_point(size=4,
aes(colour=SexF)) + theme_minimal()

Graph