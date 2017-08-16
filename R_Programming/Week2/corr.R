corr <- function(directory,threshold = 0){
    csv <- list.files(directory)
    dir.csv <- paste("specdata/", csv, sep = "")
    
    com <- complete(directory)
    nobs <- com$nobs
    ids <- com$id[nobs > threshold]
    
    #this method is far too slow
    #i <- vector()
    #for(o in 1:332){
    #    com <- complete(directory)
    #    if(com[o,2] >= threshold){
    #        i <- rbind(i,com[o,1])
    #    }
    #}
    
    corr <- vector(length = 0)
    for(j in ids){
        dt <- read.csv(dir.csv[j])
        #c <- cor(dt[,2],dt[,3],use = "complete.obs")
        c <- cor(dt$sulfate,dt$nitrate,use = "complete.obs")
        corr <- c(corr,c)
    }
    corr
}