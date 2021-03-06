#.libPaths("c:/software/Rpackages")
library(tidyverse)
library(plyr)
#library(spdep)
library(gmm)
library(emplik)
library(BELSpatial)

# spatial files ACA
#aus_nb<-read.gal("Data/ACA data/SA2_2011_AUST_qv7.gal", override.id = TRUE)
#class(aus_nb)
#W<-nb2mat(aus_nb,style="B")
#rownames(W)<-c()
#ind <- upper.tri(W)
#W[ind] <- t(W)[ind] 
#saveRDS(W,"Data/ACA data/W.RDS",version = 2)
W<- readRDS("Data/W.RDS")
ni<-rowSums(W) # no. of neighbours for each area
R<-diag(ni)
for(i in 1:nrow(R))
{
  R[i,which(W[i,]==1)]<- -1
}

lung_data<-read_csv("Data/lung.data.csv")
cov<-read_csv("Data/SA2 Data_v2.csv")
lung_data_final<-lung_data[complete.cases(lung_data),]
lung_data_final<-rename(lung_data_final,c("cancer.lung.sa2"="sa2"))
lung_data_final2<-inner_join(lung_data_final,cov,by="sa2")
lung_data_final2<-lung_data_final2%>%
  rename(.,c("ra4cat"="regions"))
lung_data_final2$regions[lung_data_final2$regions==3]<-2
lung_data_final2$regions[lung_data_final2$regions==4]<-3
# for males
y<- lung_data_final2$y.lung.male
n<- length(y) # no. of observations
var<-lung_data_final2$sd.lung.male^2
lung_data_final2<-mutate(lung_data_final2,cities=ifelse(lung_data_final2$regions==1,1,0))
lung_data_final2<-mutate(lung_data_final2,regional=ifelse(lung_data_final2$regions==2,1,0))
lung_data_final2<-mutate(lung_data_final2,remote=ifelse(lung_data_final2$regions==3,1,0))
x<- cbind(lung_data_final2$cities,lung_data_final2$regional,lung_data_final2$remote)
p<- dim(x)[2] # no. of covariates
load("Results/SBEL_ind_lung_male_5000.RData")
tau_init<- mean(c(SBEL_ind_lung_male[[1]]$tau[5000],SBEL_ind_lung_male[[2]]$tau[5000],
                  SBEL_ind_lung_male[[3]]$tau[5000]))
g<- 10# G prior evaluated at 10 for regression coefficients' prior (Zellner prior)
prior_mean_beta<- rep(0,p) # p is the number of regression parameters, in case of one covariate, p=2
beta_init<- colMeans(matrix(c(SBEL_ind_lung_male[[1]]$Beta[,5000],SBEL_ind_lung_male[[2]]$Beta[,5000],
                              SBEL_ind_lung_male[[3]]$Beta[,5000]),nrow=3,byrow = F))
# y be the response variable from the data
psi_init <- colMeans(matrix(c(SBEL_ind_lung_male[[1]]$psi[,5000],SBEL_ind_lung_male[[2]]$psi[,5000],
                              SBEL_ind_lung_male[[3]]$psi[,5000]),nrow=2148,byrow = F))

# calculating MELE of Beta, beta_mele

# using gmm package to calculate initial values of beta
mu_init<- x%*% beta_init+ psi_init
wi_mu<- el.test(y-mu_init,0)$wts # computing el weights using emplik package
wi<-wi_mu/sum(wi_mu) # sum(wi) = 1 and wi>0 constraints 


# fitting BEL BYM model taking rho= 1
library(parallel)
cluster<-makeCluster(3)
#clusterEvalQ(cl=cluster,.libPaths("c:/software/Rpackages"))
clusterEvalQ(cl=cluster,library(BELSpatial))
clusterExport(cl=cluster,varlist = c("y","x","n","p","var","beta_init", "psi_init", "tau_init","R", "wi"))
SBEL_ind_lung_male<-clusterApply(cl=cluster, x=1:3, function(z){BEL_leroux_new(y,x,n,p,var,rho=0,niter=5000,
                                                                               beta_init, psi_init, tau_init,R, wi, sd_psi=0.02, 
                                                                               sd_beta=0.003, sd_tau=0.4)})
save(SBEL_ind_lung_male,file="Results/SBEL_ind_lung_male_10000.RData")


