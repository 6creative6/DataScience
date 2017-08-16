pollutantmean <-
    function(directory,
             pollutant,
             id,
             removeNA = TRUE) {
        
        csv <- list.files(directory)
        dir.csv <- paste("specdata/", csv, sep = "")
        
        dtall <- data.frame()
        
        for (i in id) {
            dt <- read.csv(dir.csv[i])
            dtall <- rbind(dtall,dt)
        }
        
        ##??????????ֱ??
        #for (i in id){
        #dat<-rbind(dat,read.csv(files_list[i])) 
        #}
        
        cn <- colnames(dtall)
        nc <- length(cn)
        for(j in 1:nc){
            if(pollutant == cn[j]){
                means <- mean(dtall[,j], na.rm = removeNA)
            }
        }
        
        means
    }