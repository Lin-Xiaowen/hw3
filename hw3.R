getwd()
setwd('/Users/Katherine/R')

library(quantmod)
library(openxlsx)
library(DMwR)
stock <- read.xlsx('stockid.xlsx')

stockdata <- data.frame(stock1=1:82)

for(i in 1:11){
  setSymbolLookup(TEMP=list(name=stock$id[i]))
  getSymbols("TEMP", warnings=F, from='2020-02-01',to='2020-06-01')
  TEMP <- as.data.frame(TEMP)
  stockdata[, i] <- TEMP[, 2]
  colnames(stockdata)[i] <- substring(colnames(TEMP)[1], 1, nchar(colnames(TEMP)[1])-5)
}

stockdata <- t(na.omit(t(stockdata)))

stockdata_1 <- stockdata

for(i in 1:100){
  x <- sample(1:nrow(stockdata),1)
  y <- sample(1:ncol(stockdata),1)
  stockdata_1[x, y] <- NA
}

stockdata_1 <- knnImputation(stockdata_1)
a <- sum(stockdata_1[,2:ncol(stockdata_1)])/sum(stockdata[,2:ncol(stockdata)])





  
  
  
  
  
  
  
  