###########################################
# STAT 662 Generate Big Data

nr=1000 # number of rows
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
file.create("myfile.csv")
write.table(list(c.1.97,c.98,c.99,c.100), 
            file = "myfile.csv", sep = ",", 
            col.names = FALSE, append=TRUE)