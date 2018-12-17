library(aod)
library(ggplot2)
library(readxl)

all <- read.xlsx('all.xlsx')

mydata$rank <- factor(mydata$rank)
rank <-factor(all$Team)

mylogit <- glm(all$champ ~ all$Overall + all$Position + rank, data = rank, family = "binomial")