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
y<- exp(lung_data_final2$y.lung.male)
n<- length(y) # no. of observations
lung_data_final2<-mutate(lung_data_final2,cities=ifelse(lung_data_final2$regions==1,1,0))
lung_data_final2<-mutate(lung_data_final2,regional=ifelse(lung_data_final2$regions==2,1,0))
x<- cbind(1,lung_data_final2$cities,lung_data_final2$regional)
p<- dim(x)[2] # no. of covariates
alpha_1<-1 # hyperparamter for tau prior
alpha_2<-0.01 # hyperparamter for tau prior
# loaidng 10000 iteration's output for further iterations
load("D:/Meta/BEL-Meta/Results/SBEL_BYM_lung_male_10000.RData")
#tau_inv_init<- rgamma(1,alpha_1,alpha_2) # using IG prior(1,1) for tau_inv
tau_init<- SBEL_BYM_lung_male[[1]]$tau[10000]
g<- 10# G prior evaluated at 10 for regression coefficients' prior (Zellner prior)
prior_mean_beta<- rep(0,p) # p is the number of regression parameters, in case of one covariate, p=2
beta_init<- SBEL_BYM_lung_male[[1]]$Beta[,10000]
wi_init<- 1/length(y) # y be the response variable from the data
psi_init <-SBEL_BYM_lung_male[[1]]$psi[,10000]
var<- exp(lung_data_final2$sd.lung.male)
# calculating MELE of Beta, beta_mele
wi=wi_init
# using gmm package to calculate initial values of beta
#g<- log(y)~ x[,2]+x[,3]
#H<-x[,-1]
#beta_mele<- unname(gel(g,H,c(0,0,0))$coefficients)
mu_init<- exp(x%*% beta_init + psi_init)
#beta_init<-beta_mele
wi_mu<- el.test(y-mu_init,0)$wts # computing el weights using emplik package
wi_mu<-wi_mu/sum(wi_mu) # sum(wi) = 1 and wi>0 constraints 
wi<-wi_mu

# fitting BEL BYM model taking rho= 1
library(parallel)
cluster<-makeCluster(3)
#clusterEvalQ(cl=cluster,.libPaths("c:/software/Rpackages"))
clusterEvalQ(cl=cluster,library(BELSpatial))
clusterExport(cl=cluster,varlist = c("y","x","n","p","var","beta_init", "psi_init", "tau_init","R", "wi"))
SBEL_BYM_lung_male2<-clusterApply(cl=cluster, x=1:3, function(z){BEL_leroux_new(y,x,n,p,var,rho=1,niter=5000,
                                                                                 beta_init, psi_init, tau_init,R, wi, sd_psi=0.003, 
                                                                                 sd_beta=0.0008, sd_tau=0.5)})
save(SBEL_BYM_lung_male2,file="Results/SBEL_BYM_lung_male_15000.RData")



