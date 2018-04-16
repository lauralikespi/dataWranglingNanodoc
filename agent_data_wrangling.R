df_agent <- json$agent_data

col_array_agent <- c('0','1','2','3','4','5','6','7','8','9','index','my_index','size','charge','propulsion','energy','color','code','user_index')
col_array_sensors <- c('0','1','2','3','4','5','6','7','index','my_index','code','size','charge','strength','reach')
col <- length(col_array_sensors) + length(col_array_agent)

tot_rows <- length(df_agent)
col_agent <- data.frame()
for (i in 1:tot_rows){
  col_agent[i,1] <- df_agent[[i]][[1]][[1]] ## user ID
  num_agents <- length(df_agent[[i]]$user_index)
  for (j in 2:num_agents){
    for (k in 1:length(col_array_agent)){
      blah <- tryCatch(df_agent[[i]]$agent[[j]][col_array_agent[k]][[1]], error=function(e) "NA")
      if (is.null(blah)){
        blah = ""
      }
      col_agent[i,(j-2)*col+k+1] <- blah
    }
    for (l in 1:length(col_array_sensors)){
      blah <- tryCatch(df_agent[[i]]$sensors[[j]][col_array_sensors[l]][[1]], error=function(e) "NA")
      if (is.null(blah)){
        blah = ""
      }
      col_agent[i,(j-2)*col+length(col_array_agent)+1+l] <- blah
    }
  }
} 

## There is an issue with row 1529 - there is double data in the sensors (need to work out how to write this tidyily and if it happens more than once)

for (i in 1530:tot_rows){
  col_agent[i,1] <- df_agent[[i]][[1]][[1]] ## user ID
  num_agents <- length(df_agent[[i]]$user_index)
  for (j in 2:num_agents){
    for (k in 1:length(col_array_agent)){
      blah <- tryCatch(df_agent[[i]]$agent[[j]][col_array_agent[k]][[1]], error=function(e) "NA")
      if (is.null(blah)){
        blah = ""
      }
      col_agent[i,(j-2)*col+k+1] <- blah
    }
    for (l in 1:length(col_array_sensors)){
      blah <- tryCatch(df_agent[[i]]$sensors[[j]][col_array_sensors[l]][[1]], error=function(e) "NA")
      if (is.null(blah)){
        blah = ""
      }
      col_agent[i,(j-2)*col+length(col_array_agent)+1+l] <- blah
    }
  }
} 



agents_num <- (ncol(col_agent)-1)/col

col_names_agent <- "user_index";
for (count in 1:agents_num){
  col_names_agent_add <- paste(col_array_agent, count, sep = ".")
  col_names_agent<- c(col_names_agent, col_names_agent_add) 
  col_names_agent_add <- paste(col_array_sensors, count, sep = ".")
  col_names_agent<- c(col_names_agent, col_names_agent_add) 
}

colnames(col_agent) <- paste("agent_data", col_names_agent, sep = ".")

write.csv(col_agent,"agent_data2.csv")




# 
#     col_agent[i,(j-2)*col+2] <- df_agent[[i]]$agent[[j]]$'0'
#     col_agent[i,(j-2)*col+3] <- df_agent[[i]]$agent[[j]]$'1'
#     col_agent[i,(j-2)*col+4] <- df_agent[[i]]$agent[[j]]$'2'
#     col_agent[i,(j-2)*col+5] <- df_agent[[i]]$agent[[j]]$'3'
#     col_agent[i,(j-2)*col+6] <- df_agent[[i]]$agent[[j]]$'4'
#     col_agent[i,(j-2)*col+7] <- df_agent[[i]]$agent[[j]]$'5'
#     col_agent[i,(j-2)*col+8] <- df_agent[[i]]$agent[[j]]$'6'
#     col_agent[i,(j-2)*col+9] <- df_agent[[i]]$agent[[j]]$'7'
#     col_agent[i,(j-2)*col+10] <- df_agent[[i]]$agent[[j]]$'8'
#     col_agent[i,(j-2)*col+11] <- df_agent[[i]]$agent[[j]]$'9'
#     col_agent[i,(j-2)*col+12] <- df_agent[[i]]$agent[[j]]$index
#     col_agent[i,(j-2)*col+13] <- df_agent[[i]]$agent[[j]]$my_index
#     col_agent[i,(j-2)*col+14] <- df_agent[[i]]$agent[[j]]$size
#     col_agent[i,(j-2)*col+15] <- df_agent[[i]]$agent[[j]]$charge
#     col_agent[i,(j-2)*col+16] <- df_agent[[i]]$agent[[j]]$propulsion
#     col_agent[i,(j-2)*col+17] <- df_agent[[i]]$agent[[j]]$energy
#     col_agent[i,(j-2)*col+18] <- df_agent[[i]]$agent[[j]]$color
#     col_agent[i,(j-2)*col+19] <- df_agent[[i]]$agent[[j]]$code
#     col_agent[i,(j-2)*col+20] <- df_agent[[i]]$agent[[j]]$user_index



