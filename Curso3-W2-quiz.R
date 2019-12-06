archivo <- read.fwf("getdata_wksst8110.for", widths = c(15,4,9,4,9,4,9,4,9), skip=4)

head(archivo)

sum(archivo$SST_2)