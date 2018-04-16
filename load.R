setwd("~/Documents/PhD/semester2/nanodoc")

library(jsonlite) 
json <- fromJSON(paste("[",paste(readLines("scores.json"),collapse=","),"]"))

scores_csv <- read.csv("score_lg.csv",header= FALSE)

front_col <- scores_csv[,c(1,2,3,4,5,6,7,8)]
pre_col <- ncol(front_col)
colnames(front_col) <- paste("user", 1:pre_col, sep = ".")

back_col <- scores_csv[,10]


sec1 <- json$timeline_data[,1:4]
#sec2 <- json$timeline_data[,5][,2]
sec3 <- json$timeline_data[,6:9]
#sec4 <- json$timeline_data[,10][,2]
sec5 <- json$timeline_data[,11]
colnames(sec1) <- paste("timeline_data", colnames(sec1), sep = ".")
#colnames(sec2) <- paste("timeline_data.4.data", colnames(sec2), sep = ".")
colnames(sec3) <- paste("timeline_data", colnames(sec3), sep = ".")
#colnames(sec4) <- paste("timeline_data.data.data", colnames(sec4), sep = ".")
#colnames(sec5) <- paste("timeline_data", "dosage", sep = ".")

scen <- json$scenario[,1:11]
colnames(scen) <- paste("scenario", colnames(scen), sep = ".")

source("timeline_wrangling.R")
source("scenarios_regions_wrangling.R")
source("agent_data_wrangling.R")
#test <- cbind(cbind(cbind(cbind(cbind(cbind(cbind(cbind(cbind(cbind(front_col,sec1),col5),sec2),sec3),col11),sec4),sec5),scen),col_regions),back_col)
tidy_data <- cbind(cbind(cbind(cbind(cbind(cbind(cbind(cbind(front_col,sec1),col5),sec3),col11),col_agent),scen),col_regions),back_col)
write.csv(tidy_data,"tidy_data.csv")
