library(readxl)

setwd("C:/Users/TG019618/Desktop/NFL/MoneyBallNFL/AllTeam/2017")
y2017 <- read_excel("2017.xlsx")
y2017['year'] <-c('2017')

install.packages("sqly")
library(sqly)

y2017 <- y2017[,c("Team","Position","First Name", "Overall", "champ", "year")]

colnames(y2016) <- c("Team", "Position", "Name", "Overall", "champ", "year")

library('dplyr')
resultado <- y2001%>%full_join(y2002)%>%full_join(y2003)%>%full_join(y2005)%>%full_join(y2006)%>%full_join(y2007)%>%full_join(y2008)%>%full_join(y2009)%>%full_join(y2010)%>%full_join(y2012)%>%full_join(y2013)%>%full_join(y2016)%>%full_join(y2017)

library('openxlsx')
write.xlsx(resultado, 'all.xlsx')