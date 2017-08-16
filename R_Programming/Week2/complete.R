complete <- function(directory,id = 1:332){
    csv <- list.files(directory)
    dir.csv <- paste("specdata/", csv, sep = "")
    complete <- data.frame()
    for (i in id) {
        dt <- read.csv(dir.csv[i])
        x <- complete.cases(dt)
        s <- sum( x == TRUE)
        c <- data.frame(id = i, nobs = s)
        complete <- rbind(complete,c)
    }
    complete
}