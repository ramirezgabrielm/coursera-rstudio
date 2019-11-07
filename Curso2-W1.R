df_archivo <- read.csv("C:/Users/gramirez/Documents/Coursera/quiz1_data/hw1_data.csv")

colnames(df_archivo)

head(df_archivo, 2)

nrow(df_archivo)

tail(df_archivo, 2)

df_archivo[47,]

sum(is.na(df_archivo$Ozone)) º length(which(is.na(df_archivo$Ozone)))

mean(df_archivo$Ozone,na.rm="TRUE")

mean(subset(df_archivo, Ozone > 31 & Temp > 90)$Solar.R ,na.rm="TRUE")

mean(subset(df_archivo, Month==6)$Temp,na.rm="TRUE")

max(subset(df_archivo, Month==5)$Ozone,na.rm="TRUE")
