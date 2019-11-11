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