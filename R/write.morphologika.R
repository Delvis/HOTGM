write.morphologika <- function(A, file){
    # write.morphologika
    # authors:
    #   João Coelho
    #   David Navega
    #   Department of Life Sciences
    #   University of Coimbra
    # todo(all): document function
    
    # get dimension and dimension names
    dims <- dim(A)
    dims.names <- dimnames(A)
    # [individuals]
    n <- dims[3]
    # [landmarks]
    p <- dims[1]
    # [dimensions]
    k <- dims[2]
    
    # initialize morphologika.file
    morphologika.file <- NULL
    morphologika.file <- paste(morphologika.file,'[individuals]', "\n", sep = "")
    morphologika.file <- paste(morphologika.file,n,"\n", sep = "")
    morphologika.file <- paste(morphologika.file,'[landmarks]', "\n", sep = "")
    morphologika.file <- paste(morphologika.file,p,"\n", sep = "")
    morphologika.file <- paste(morphologika.file,'[dimensions]', "\n", sep = "")
    morphologika.file=paste(morphologika.file,k,"\n", sep="")
    morphologika.file=paste(morphologika.file,'[names]', "\n", sep ="")
    
    for (i in 1:n){
        morphologika.file= paste(morphologika.file, 
                                 dims.names[[3]][i], "\n", sep = "")
    }
    
    morphologika.file=paste(morphologika.file, "\n", sep="")
    morphologika.file=paste(morphologika.file,'[rawpoints]', "\n", sep ="")
    
    for (i in 1:n){
        morphologika.file=paste(morphologika.file,"\n",sep="")
        morphologika.file=paste(morphologika.file,
                                paste("'", dims.names[[3]][i], sep=""),
                                "\n", sep ="")
        morphologika.file=paste(morphologika.file, "\n", sep = "")
        
        for (j in 1:p){
            if(k==3){
                string <- paste(formatC(A[j,1,i],digits = 6), 
                                formatC(A[j,2,i],digits = 6), 
                                formatC(A[j,3,i],digits = 6), 
                                sep = " " )
            }else if(k==2){
                string <- paste(formatC(A[j,1,i],digits = 6), 
                                formatC(A[j,2,i],digits = 6), 
                                sep = " " )
            }
            morphologika.file <- paste(morphologika.file, string, "\n", sep = "")
        }
    }
    
    sink(file)
    cat(morphologika.file)
    sink() 
}
