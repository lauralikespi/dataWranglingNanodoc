df_regions <- json$scenario$regions
dfs <- length(df_regions)
columns <- 4

col_regions <- data.frame()
for (i in 1:dfs){
  #col_regions[i,1] <- i
  rows <- nrow(df_regions[[i]])
  if (length(rows) > 0){
    for (j in 1:rows){
      for (k in 1:columns){
        #col_regions[i,(j-1)*4+k+1] <- df_regions[[i]][[k]][[j]]
        col_regions[i,(j-1)*4+k] <- df_regions[[i]][[k]][[j]]
      }
    }
  }
}

num_regions <- ncol(col_regions)/4
region_list <- c("type", "receptor", "lethal_in", "lethal_out")
col_names_regions <- list();

for (count in 1:num_regions){
  col_names_regions_add <- paste(region_list, count, sep = ".")
  col_names_regions<- c(col_names_regions, col_names_regions_add) 
}

colnames(col_regions) <- paste("scenario.regions", col_names_regions, sep = ".")

