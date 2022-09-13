library(readxl)
library(choiceDes)

design <- function(dataset, outdir){
    dat <- read_excel(dataset)

    # preliminary operations in the dataset (change from numeric to categorical variables)
    dat <- as.data.frame(dat)
    for(i in 1:(length(dat[1,])-3)) {
        dat[,i] = as.factor(dat[,i])
    }

    # full factorial matrix creation
    a <- rep(0, length(dat[1,])-3)
    for (i in 1: length(dat[1,])-3){
        a[i] <- length(levels(dat[,i]))
    }
    cand <- gen.factorial(a)

    # matrix design creation
    set.seed(1)
    design <- dcm.design.cand(
        cand=cand,
        sets=as.numeric(dat[,length(dat)-2][1]),
        alts=as.numeric(dat[,length(dat)-1][1]),
        nb=as.numeric(dat[,length(dat)][1])
    )
    design <- design$levels
    k <- 0
    for (i in 4:length(design[1,])){
        k <- k+1
        names(design)[i] = names(dat)[k]
    }

    # write the code in a csv file
    # fileName <- sprintf("%s_%s.csv", as.integer(Sys.time()), digest::digest(design))
    file <- write.csv(design, file=file.path(outdir, "output.csv"))
    z <- list(design, file)
    print(z)

    return(z)
}