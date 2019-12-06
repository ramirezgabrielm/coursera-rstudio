library(stringr)

pollutantmean <- function(directory,pollutant, id = 1:332) {
   
   pollutant_vector <- c()
   
   for ( my_id in 1:length(id) ){
      file_name <- paste(str_pad(id[my_id], 3 , pad = "0"),".csv",sep="")  
      file <- file.path(directory,file_name)
      archivo <- read.csv(file)
      pollutant_vector <- c(pollutant_vector,archivo[[pollutant]])
      
   }
   mean(pollutant_vector,na.rm=TRUE )
}


complete <- function(directory, id = 1:332) {
   
   file_nrow <- c()
   file_id <- c()
   
   
   for ( my_id in 1:length(id) ){
      file_name <- paste(str_pad(id[my_id], 3 , pad = "0"),".csv",sep="")  
      file <- file.path(directory,file_name)
      archivo <- read.csv(file)
      archivo_subset <- subset(archivo, !is.na(archivo$sulfate) & !is.na(archivo$nitrate))
      #print(archivo_subset)
      file_nrow <- c(file_nrow, nrow(archivo_subset))
      file_id <- c(file_id, id[my_id])
      #pollutant_vector <- c(pollutant_vector,archivo[[pollutant]])

   }
   #mean(pollutant_vector,na.rm=TRUE )
   
   my_df <- data.frame(file_id,file_nrow)
   colnames(my_df) <- c("id","nobs")
   my_df
   
}


corr <- function(directory, threshold = 0) {
   
   file_nrow <- c()
   file_id <- c()
   corr_sul_nit <- c()
   
   
   for ( my_id in 1:332 ){
      file_name <- paste(str_pad(my_id, 3 , pad = "0"),".csv",sep="")  
      file <- file.path(directory,file_name)
      archivo <- read.csv(file)
      archivo_subset <- subset(archivo, !is.na(archivo$sulfate) & !is.na(archivo$nitrate))
      #print(archivo_subset)
      file_nrow <- nrow(archivo_subset)
      
      if(file_nrow > threshold){
      
         corr_sul_nit <- c(corr_sul_nit, cor(archivo_subset$sulfate,archivo_subset$nitrate))
      
      }
      
      #file_id <- c(file_id, id[my_id])
      #pollutant_vector <- c(pollutant_vector,archivo[[pollutant]])
      
   }
   
   corr_sul_nit
   
}