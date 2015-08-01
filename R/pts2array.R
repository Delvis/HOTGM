pts2array <- function(pts.dir,missing = -9999){
# write.morphologika
# authors:
#   João Coelho
#   David Navega
#   Department of Life Sciences
#   University of Coimbra
# todo(all): document function
    
    tmp.dir <- getwd()
    
    pts.names <- dir(path = pts.dir)
    
    N <- length(pts.names)
    
    pts.files <- paste(pts.dir, pts.names, sep = "/")          
    
    var.names<- read.table(file = pts.files[1], header = F, sep = "",
                           dec = ".", skip = 2, na.strings = missing)[,1]
    dims<- dim(read.table(file = pts.files[1], header = F, sep = "",
                           dec = ".", skip = 2, na.strings = missing)[,-1]) 
          
    output <- array(data = NA, dim = c(dims,N), 
                    dimnames = list(var.names, c('X', 'Y','Z'), 
                                    gsub(pattern = '.pts',replacement = "",
                                         x = pts.names)))
    
    for(i in 1:N){
        output[,,i] <- as.matrix(read.table(file = pts.files[i],
                                            header = F, sep = "", 
                                            dec = ".", skip = 2, 
                                            na.strings = missing)[,-1])
    }
    return(output)
}