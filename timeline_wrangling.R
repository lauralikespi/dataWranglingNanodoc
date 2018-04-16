df_time <- json$timeline_data

df5 <- df_time[,5][,1]

df11 <- df_time[,10][,1]

dfs <- length(df5)
columns <- 4

col5 <- data.frame()
for (i in 1:dfs){
#  col5[i,1] <- i
  rows <- nrow(df5[[i]])
  if (length(rows) > 0){
    for (j in 1:rows){
      for (k in 1:columns){
    #      col5[i,(j-1)*4+k+1] <- df5[[i]][[k]][[j]]
          col5[i,(j-1)*4+k] <- df5[[i]][[k]][[j]]
        }
      }
  }
}

list_names <- c("ID","dosage","start","end")

col_names_timeline <- list();
for (i in 1:4){
  col_names_timeline_add <- paste(list_names, i, sep = ".")
  col_names_timeline <- c(col_names_timeline, col_names_timeline_add) 
}

colnames(col5) <- paste("timeline_data.4.timeline", col_names_timeline, sep = ".")

dfs <- length(df11)
columns <- 4

col11 <- data.frame()
for (i in 1:dfs){
  #col11[i,1] <- i
  rows <- nrow(df11[[i]])
  if (length(rows) > 0){
    for (j in 1:rows){
      for (k in 1:columns){
        #col11[i,(j-1)*4+k+1] <- df11[[i]][[k]][[j]]
        col11[i,(j-1)*4+k] <- df11[[i]][[k]][[j]]
      }
    }
  }
}

colnames(col11) <- paste("timeline_data.data.timeline", col_names_timeline, sep = ".")
