library(fpc)
set.seed(21)
emb_df = read.csv("DFTD.csv")
#head(emb_df)

#####################
#### Elbow Rule ####
####################

wss<- NULL

for (i in 1:10){
  fit1=kmeans(emb_df[,-1],centers = i)
  wss=c(wss, fit1$tot.withinss)
}

plot(1:10, wss, type = "o")


####################
#### fit model ####
###################
fit <- kmeans(emb_df[,-1], 3,)
# Cluster
fit$cluster

# Summary
summary(fit)

# Names
names(fit)

#tot.withinss
fit$tot.withinss

# ratio bss/tss 
#BSS(k) measures how far apart the clusters are from each other. A good clustering has a small WSS(k) and a large BSS(k).
fit$betweenss/fit$totss


######################
#### Plot Kmeans ####
#####################
fit2 <- kmeans(emb_df[,-1], 3,)
fit3 <- kmeans(emb_df[,-1], 4,)
plotcluster(emb_df[,-1],fit2$cluster)
plotcluster(emb_df[,-1],fit3$cluster)


############################
#### get the sub string ####
############################

subsample <- list()
for(i in 1:4){
  subsample[[i]]<- emb_df[fit3$cluster==i,-1]
}


sub<-rownames(subsample[[1]])
gsub("\"","",sub, fixed = TRUE )



subset1<- subset(emb_df, rownames(emb_df) %in% rownames(subsample[[1]]))
subset2<- subset(emb_df, rownames(emb_df) %in% rownames(subsample[[2]]))
subset3<- subset(emb_df, rownames(emb_df) %in% rownames(subsample[[3]]))
subset4<- subset(emb_df, rownames(emb_df) %in% rownames(subsample[[4]]))
#subset5<- subset(emb_df, rownames(emb_df) %in% rownames(subsample[[5]]))
#subset6<- subset(emb_df, rownames(emb_df) %in% rownames(subsample[[6]]))

Net<-emb_df
head(Net)


Group1<-as.data.frame(unique(Net[Net$Celebrity %in% subset1$Celebrity, "Celebrity"]))
Group2<-as.data.frame(unique(Net[Net$Celebrity %in% subset2$Celebrity, "Celebrity"]))
Group3<-as.data.frame(unique(Net[Net$Celebrity %in% subset3$Celebrity, "Celebrity"]))
Group4<-as.data.frame(unique(Net[Net$Celebrity %in% subset4$Celebrity, "Celebrity"]))
#Group5<-as.data.frame(unique(Net[Net$Celebrity %in% subset5$Celebrity, "Celebrity"]))
#Group6<-as.data.frame(unique(Net[Net$Celebrity %in% subset6$X, "Celebrity"]))



write.csv(Group1, file = "Output/mix1.csv")
write.csv(Group2, file = "Output/mix2.csv")
write.csv(Group3, file = "Output/mix3.csv")
write.csv(Group4, file = "Output/mix4.csv")
#write.csv(Group5, file = "Output/g5.csv")
#write.csv(Group6, file = "Output/G6.csv")









##########################################
#### Performe hierarchical clustering ####
##########################################
## calculate the distance matrix
emb.dist<- dist(emb_df[,-1])
emb.dist

#obtain clusters
emb.hcluster<- hclust(emb.dist)
plot(emb.hcluster)

library(pvclust)
?pvclust
pvmodel = pvclust(t(emb_df[,-1]),
                  method.dist = "minkowski",
                  method.hclust = "complete",
                  nboot = 2000)
plot(pvmodel)
pvrect(pvmodel, alpha = 0.95)

#if(!require(dendextend)) install.packages("dendextend") 
library(dendextend)
# Copy the object, and edit its labels
dend2 <- as.dendrogram(pvmodel)
labels(dend2) <- emb_df[,1]


# compare the two dendrograms:
#par(mfrow = c(1,1))
plot(pvmodel, main = "original dend")
plot(dend2, main = "dend with edited labels")