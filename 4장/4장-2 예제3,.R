DF <- read.csv("example_cancer.csv",stringsAsFactors=F ,na="기록없음")
str(DF)

attach(DF)

mean(age)
summary(age)
boxplot(age, range=1.5)
grid()