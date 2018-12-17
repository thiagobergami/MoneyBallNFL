library(readxl)

setwd("C:/Users/TG019618/Desktop/NFL/MoneyBallNFL/AllTeam/2017")
y2017 <- read_excel("2017.xlsx")
y2017['year'] <-c('2017')

install.packages("sqldf")
library(sqldf)

df2009 <- y2009[,c("Team","Position","first", "OVERALL", "champ", "year")]

colnames(df2008) <- c("Team", "Position", "Name", "Overall", "champ", "year")

