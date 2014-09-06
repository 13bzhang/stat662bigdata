###########################################
# STAT 662 Generate Big Data Using R

install.packages("rbenchmark")
library(rbenchmark)

genbig <- function(times,size,filename){
  file.create(filename)
  gensize <- function(size,filename){
    nr <- size # number of rows
    # function to sample and create the numerical columns (1-97)
    cnum <- function(nr) {
      sample(x=c(0.1, 0.2, 0.3),size=nr,replace=T)
    }
    c.1.97 <- sapply(rep(nr,97),cnum) # create columns 1-97
    c.98 <- sample(x=c(-1,0,1),size=nr,replace=T) # create column 98
    c.99 <- sample(x=letters, size=nr, replace=T) # create column 99
    # function to generate random string
    mstring <- function(max=8){
      pool=c(letters,seq(from=-9, to=9))
      paste(sample(x=pool, size=sample(1:max,1)),collapse="")
    }
    c.100 <- sapply(rep(8,nr),mstring) # create column 100
    write.table(list(c.1.97,c.98,c.99,c.100), 
                file = filename, sep = ",", 
                col.names = FALSE, row.names=FALSE,append=TRUE)
  }
  replicate(times,gensize(size,filename))
}
# benchmark
benchmark(genbig(times=50,size=1000,filename="mytest.csv"),replications=10)
# Baobao's Computer: Macbook Pro 9.2 (4 GB of RAM), Ubuntu Linux OS
  # performance on 40MB in R: 10 runs in 126.128 seconds
  # average performance: 12.6128 seconds per 40MB in R (1% of my total RAM)
