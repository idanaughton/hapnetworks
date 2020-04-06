## R code to create haplotype network in R. 
## Before importing file, I converted all sample names to the name of the corresponding population. This results in easier mapping to figure legend

library(ape)

apat <- read.dna("/Users/idanaughton/Documents/UCE/Aphaenogaster_phylogeography/Hap_net_4-5.fas", format="fasta")
apat

library(pegas)
library(adegenet)

apatHaps <- haplotype(apat) #sort input data into haplotypes
apatHaps

apatNet <- haploNet(apatHaps) # create haplotye network
plot(apatNet, size = attr(apatNet,"freq"), fast = FALSE, labels = TRUE) #plot network

##Adding population names to netwrok
ind.hap<-with(
  stack(setNames(attr(apatHaps, "index"), rownames(apatHaps))), 
  table(hap=ind, pop=rownames(apat)[values])
)

ind.hap

## now we add population names and legend to the plot
plot(apatNet, size=attr(apatNet, "freq"), scale.ratio = .2, cex = 0.8, pie=ind.hap)
legend("topleft", colnames(ind.hap), col=rainbow(ncol(ind.hap)), cex = .75, pch=20)






