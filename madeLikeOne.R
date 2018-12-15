library(readxl)

setwd("C:/Users/thiag/Desktop/NFL/MoneyBallNFL/AllTeam/2017")
y2017 <- read_excel("2017.xlsx")
y2017['year'] <-c('2017')



resultado <- y2001%>%full_join(y2002)%>%full_join(y2003)%>%full_join(y2004)%>%full_join(y2005)%>%full_join(y2006)%>%full_join(y2007)%>%full_join(y2008)%>%full_join(y2009)%>%full_join(y2010)%>%full_join(y2012)%>%full_join(y2013)%>%full_join(y2014)%>%full_join(y2015)%>%full_join(y2016)%>%full_join(y2017)