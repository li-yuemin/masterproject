#####Calculate neutrality test statistics for each gene
rm(list=ls())
library(PopGenome)
getwd()
setwd("~/Sequences/Gene")
VCF<-readData("CHB",format ="VCF" )
#VCF<-readData("CEU",format ="VCF" )
#VCF<-readData("YRI",format ="VCF" )
get.sum.data(VCF)
VCF
show.slots(VCF)
VCF@n.sites
get.individuals(VCF)
VCF<-neutrality.stats(VCF)
VCF<-F_ST.stats(VCF)
#VCF<-linkage.stats(VCF)
get.sum.data(VCF)
get.neutrality(VCF)[[1]]
get.diversity(VCF)[[1]]
#get.linkage(VCF)[[1]]
VCF@theta_Watterson

#####simulations are performed using ms 
#####input ms output file to analyse the simulated data
rm(list=ls())
library(PopGenome)
getwd()
setwd("~/Project/Simulations")

ms1<-readMS(file="Gene/Population.out")
ms1<-neutrality.stats(ms1)
stat<-as.data.frame(get.neutrality(ms1)[[1]])
summary(stat)

hist(stat$Tajima.D,prob=TRUE,main="", xlab="Gene Pop Tajima's D")
lines(density(stat$Tajima.D,na.rm=TRUE), # density plot
      lwd = 2)
abline(v= observed_value, col = "red",lwd = 2)
abline(v = quantile(stat$Tajima.D,c(0.025,0.975)), col = "blue",lwd = 2, lty=5)
sum(stat$Tajima.D >= observed_value )*2/1000

hist(stat$Fu.Li.F,prob=TRUE,main="", xlab="Gene Pop Fu and Li's F*")
lines(density(stat$Fu.Li.F,na.rm=TRUE), # density plot
      lwd = 2)
abline(v= observed_value, col = "red",lwd = 2)
abline(v = quantile(stat$Fu.Li.F,c(0.025,0.975)), col = "blue",lwd = 2, lty=5)
sum(stat$Fu.Li.F >= observed_value)*2/1000

hist(stat$Fu.Li.D,prob=TRUE,main="", xlab="Gene Pop Fu and Li's D*")
lines(density(stat$Fu.Li.D,na.rm=TRUE), # density plot
      lwd = 2)
abline(v= observed_value, col = "red",lwd = 2)
abline(v = quantile(stat$Fu.Li.D,c(0.025,0.975)), col = "blue",lwd = 2, lty=5)
sum(stat$Fu.Li.D <= observed_value)*2/1000