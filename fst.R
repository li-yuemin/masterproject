#####Fst calculations
rm(list=ls())
library(PopGenome)
getwd()
setwd("~/Project/Sequences/Gene") #Insert gene that will be tested
CHB<-readData("CHB",format ="VCF" )
CEU<-readData("CEU",format="VCF")
YRI<-readData("YRI",format="VCF")
ALL1<-readData("ALL1",format="VCF")
get.individuals(CHB)[[1]]
get.individuals(ALL1)[[1]]
ALL<-set.populations(ALL1,list(c(get.individuals(CHB)[[1]]),c(get.individuals(CEU)[[1]]),c(get.individuals(YRI)[[1]])))
ALL@populations
ALL<-F_ST.stats(ALL)

ALL<-F_ST.stats.2(ALL)
ALL<-neutrality.stats(ALL)
get.diversity(ALL)[[1]]
get.neutrality(ALL)[[1]]
ALL@region.stats@haplotype.diversity
ALL@region.stats@haplotype.counts
get.sum.data(ALL)

get.F_ST(ALL)
get.F_ST(ALL,pairwise = TRUE)
get.F_ST(ALL,pairwise = TRUE)[[1]]
get.F_ST(ALL,pairwise = TRUE)[[2]]
get.F_ST(ALL,pairwise = TRUE)[[3]]



