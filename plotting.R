dnds<-read.csv("dnds.csv",header = FALSE)
plot(x=dnds[,2],y=dnds[,1],ylab="dN/dS",xlab = "Chromosome",xaxt="n")
axis(side = 1,at = 0:23, cex.axis = 1)

fst<-read.csv("Fst.csv",header = FALSE)
plot(x=fst[,6],y=fst[,4],xlab = "Chromosome",ylab = "Fst",xaxt="n",main = "CEU/YRI")
axis(side = 1,at = 0:23, cex.axis = 1)