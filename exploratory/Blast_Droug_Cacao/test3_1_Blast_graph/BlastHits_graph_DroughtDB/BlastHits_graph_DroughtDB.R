
Library("RColorBrewer")
#get the data into R
KZ0ACR<-read.csv("results_Blast_RPPSSHPNGb_KZ0ACR.csv")
KZ0ACAL<-read.csv("results_Blast_RPPSSHPNGa_KZ0ACAL.csv")
KZ0ACAD<-read.csv("results_Blast_MIRIDUFS_KZ0ACAD.csv")
KZ0ACV<- read.csv("results_Blast_LESSHMEPNGb_KZ0ACV.csv")
KZ0ACAP<-read.csv("results_Blast_LESSHMEPNGa_KZ0ACAP.csv")
KZ0ACAN<-read.csv("results_Blast_SSHMIRUFa_KZ0ACAN.csv")
KZ0ACB<-read.csv("results_Blast_STSSHWB2Sb_KZ0ACB.csv")
KZ0ACQ<-read.csv("results_Blast_LEAVPAGU_KZ0ACQ.csv")
KZ0ACT<-read.csv("results_Blast_SSHMIRUFb_KZ0ACT.csv")
KZ0ABI_K<-read.csv("results_Blast_STSSHWB1S_KZ0ABI_K.csv")
KZ0ACAF<-read.csv("results_Blast_DROUGHTLS_KZ0ACAF.csv")

CDS_CriolloV2<-read.csv("results_Blast_test2_1_CDS_CriolloV2.csv")
KZ0ABP<-read.csv("results_Blast_LESSHPNGRSb_KZ0ABP.csv")
KZ0ACP<-read.csv("results_Blast_LEPAPNGR_KZ0ACP.csv")
KZ0ABE<-read.csv("results_Blast_LEAVES_KZ0ABE.csv")
KZ0ACAE<-read.csv("results_Blast_DROUGHTRS_KZ0ACAE.csv")
KZ0AA<-read.csv("results_Blast_COSSHPPI_IS_KZ0AA_fixed.csv")
KZ0AC_fixed<-read.csv("results_Blast_RESSHMEPNGb_KZ0AC_fixed.csv")


#Merging the dataframes and creating the dataset
library("dplyr")
results_blast18<-bind_rows(KZ0ACR,
                           KZ0ACAL,
                           KZ0ACAD,
                           KZ0ACV,
                           KZ0ACAP,
                           KZ0ACAN,
                           KZ0ACB,
                           KZ0ACQ,
                           KZ0ACT,
                           KZ0ABI_K,
                           KZ0ACAF,
                           CDS_CriolloV2,
                           KZ0ABP,
                           KZ0ACP,
                           KZ0ABE,
                           KZ0ACAE,
                           KZ0AA,
                           KZ0AC_fixed)
summary(results_blast18)
results_blast18 %>% count(Dataset) #count observations by group (194 sequences per dataset)

results_blast17<-bind_rows(KZ0ACR, #dataset without the genome
                           KZ0ACAL,
                           KZ0ACAD,
                           KZ0ACV,
                           KZ0ACAP,
                           KZ0ACAN,
                           KZ0ACB,
                           KZ0ACQ,
                           KZ0ACT,
                           KZ0ABI_K,
                           KZ0ACAF,
                           KZ0ABP,
                           KZ0ACP,
                           KZ0ABE,
                           KZ0ACAE,
                           KZ0AA,
                           KZ0AC_fixed)
summary(results_blast17)
results_blast17 %>% count(Dataset) #count observations by group (194 sequences per dataset)


#graph a grouped barplot
library("ggplot2")


##Bar plot of the complete number of datasets (18)
#CReate color palette to get as many as 18 colors
colorCount= length(unique(results_blast18$Dataset))
getPalette= colorRampPalette(brewer.pal(9,"Set1"))
#stack bar plot, saves more space
p2<-ggplot(results_blast18, aes(fill=getPalette(colorCount), y=Number.of.hits, x=Query)) + 
  geom_bar(position = "dodge", stat = "identity") #dodge: individual bars for each library
p2 + theme(axis.text.x = element_text(angle = 90, hjust = 1) ) #rotate and adjust x axis text


p1<-ggplot(results_blast18, aes(fill=Dataset, y=Number.of.hits, x=Query)) + 
  geom_bar(position = "stack", stat = "identity", color="black") #stack: bars arrange one on top of the other
p1 + scale_fill_manual(values = getPalette(colorCount)) + theme(axis.text.x = element_text(angle = 90, hjust = 1) ) #rotate and adjust x axis text


##Graph: Results 17 (without the Criollo Genome)
#CReate color palette to get as many as 17 colors
colorCount2= length(unique(results_blast17$Dataset))
getPalette2= colorRampPalette(brewer.pal(9,"Set1"))

p4<-ggplot(results_blast17, aes(fill=Dataset, y=Number.of.hits, x=Query)) + 
  geom_bar(position = "stack", stat = "identity", color="black") #stack: bars arrange one on top of the other
p4 + scale_fill_manual(values = getPalette2(colorCount2)) + theme(axis.text.x = element_text(angle = 90, hjust = 1) ) #rotate and adjust x axis text


#Data frame EST only with sequences containing other than zero (0) hits
results_blastEST_hits<-subset(results_blast17, Number.of.hits > 0) #subset of query with number of hits bigger than 0
colorCount3= length(unique(results_blastEST_hits$Dataset)) #extend color palette
getPalette3= colorRampPalette(brewer.pal(12,"Paired"))


p7<-ggplot(results_blastEST_hits, aes(fill=Dataset, y=Number.of.hits, x=Query)) + 
  geom_bar(position = "stack", stat = "identity", color="black") #stack: bars arrange one on top of the other
p7 + scale_fill_manual(values = getPalette3(colorCount3)) + theme(axis.text.x = element_text(angle = 90, hjust = 1) ) #rotate and adjust x axis text

p8<-ggplot(results_blastEST_hits, aes(fill=Dataset, y=Number.of.hits, x=Query)) + 
  geom_bar(position = "dodge", stat = "identity", color="black") #dodge
p8 + scale_fill_manual(values = getPalette3(colorCount3)) + theme(axis.text.x = element_text(angle = 90, hjust = 1) ) #rotate and adjust x axis text

#including Genome criollo: observations with more than 0 hits

results_blast18_hits<-subset(results_blast18, Number.of.hits > 0) #subset of query with number of hits bigger than 0
colorCount4= length(unique(results_blast18_hits$Dataset)) #extend color palette
getPalette4= colorRampPalette(brewer.pal(12,"Paired"))


p9<-ggplot(results_blast18_hits, aes(fill=Dataset, y=Number.of.hits, x=Query)) + 
  geom_bar(position = "stack", stat = "identity", color="black") #stack: bars arrange one on top of the other
p9 + scale_fill_manual(values = getPalette4(colorCount4)) + theme(axis.text.x = element_text(angle = 90, hjust = 1) ) #rotate and adjust x axis text

p8<-ggplot(results_blast18_hits, aes(fill=Dataset, y=Number.of.hits, x=Query)) + 
  geom_bar(position = "dodge", stat = "identity", color="black") #stack: bars arrange one on top of the other
p8 + scale_fill_manual(values = getPalette3(colorCount3)) + theme(axis.text.x = element_text(angle = 90, hjust = 1) ) #rotate and adjust x axis text

#Graph: Genome Criollo all and only hits
results_blastCriolloV2_hits<-subset(CDS_CriolloV2, Number.of.hits > 0) #subset of query with number of hits bigger than 0
p5<-ggplot(CDS_CriolloV2, aes(fill=Dataset, y=Number.of.hits, x=Query)) + 
  geom_bar(position = "stack", stat = "identity", color="black") #stack: bars arrange one on top of the other
p5 + theme(axis.text.x = element_text(angle = 90, hjust = 1) )


p10<-ggplot(results_blastCriolloV2_hits, aes(fill=Dataset, y=Number.of.hits, x=Query)) + 
  geom_bar(position = "stack", stat = "identity", color="black") #stack: bars arrange one on top of the other
p10 + theme(axis.text.x = element_text(angle = 90, hjust = 1) )
