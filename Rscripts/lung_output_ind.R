# output formatting for lung cancer (male)
# Model: SBEL ind

load("U:/Research/Projects/sef/bayes_meta_el/SBEL_ind_lung_male_10000.RData")
# checking traceplot and density plots for convergence
par(mfrow=c(2,2))
plot(1:10000,SBEL_ind_lung_male[[1]]$Beta[1,],type="l",col="green", main= "Traceplot for intercept")
lines(1:10000,SBEL_ind_lung_male[[2]]$Beta[1,],type="l",col="blue")
lines(1:10000,SBEL_ind_lung_male[[3]]$Beta[1,],type="l",col="red")
plot(1:10000,SBEL_ind_lung_male[[1]]$Beta[2,],type="l",col="green", main= "Traceplot for coeffcient(major cities)")
lines(1:10000,SBEL_ind_lung_male[[2]]$Beta[2,],type="l",col="blue")
lines(1:10000,SBEL_ind_lung_male[[3]]$Beta[2,],type="l",col="red")
plot(1:10000,SBEL_ind_lung_male[[1]]$Beta[3,],type="l",col="green", main= "Traceplot for coeffcient(regional)")
lines(1:10000,SBEL_ind_lung_male[[2]]$Beta[3,],type="l",col="blue")
lines(1:10000,SBEL_ind_lung_male[[3]]$Beta[3,],type="l",col="red")
plot(1:10000,SBEL_ind_lung_male[[1]]$tau,type="l",col="green", main= "Traceplot for precsion")
lines(1:10000,SBEL_ind_lung_male[[2]]$tau,type="l",col="blue")
lines(1:10000,SBEL_ind_lung_male[[3]]$tau,type="l",col="red")
plot(density(SBEL_ind_lung_male[[1]]$Beta[3,]))

# applying thining by 1 and burnin=1000 and saving as mcmc
 
thin_MCMC<- function(output,burnin=10000,thin=10)
{
  if(class(output)=="numeric")
  {
    niter=length(output)
    out_postburn<-output[(burnin+1):niter]
    n<-length(out_postburn)
    out_thin<- out_postburn[seq(1,n,by=thin)]
    return(out_thin)
  }
  
  else{
    niter=dim(output)[2]
    out_postburn<-output[,(burnin+1):niter]
    n<-dim(out_postburn)[2]
    out_thin<- out_postburn[,seq(1,n,by=thin)]
    return(out_thin)
  }
  out_thin
}

chain1_beta0<-SBEL_ind_lung_male[[1]]$Beta[1,]
chain1_beta1<-SBEL_ind_lung_male[[1]]$Beta[2,]
chain1_beta2<-SBEL_ind_lung_male[[1]]$Beta[3,]
chain1_psi<-SBEL_ind_lung_male[[1]]$psi
chain1_tau<-SBEL_ind_lung_male[[1]]$tau
chain2_beta0<-SBEL_ind_lung_male[[2]]$Beta[1,]
chain2_beta1<-SBEL_ind_lung_male[[2]]$Beta[2,]
chain2_beta2<-SBEL_ind_lung_male[[2]]$Beta[3,]
chain2_psi<-SBEL_ind_lung_male[[2]]$psi
chain2_tau<-SBEL_ind_lung_male[[2]]$tau
chain3_beta0<-SBEL_ind_lung_male[[3]]$Beta[1,]
chain3_beta1<-SBEL_ind_lung_male[[3]]$Beta[2,]
chain3_beta2<-SBEL_ind_lung_male[[3]]$Beta[3,]
chain3_psi<-SBEL_ind_lung_male[[3]]$psi
chain3_tau<-SBEL_ind_lung_male[[3]]$tau

# Apply these to all BEL models after thinning and save with proper names
# thinned chains
chain1_beta0_thin<-thin_MCMC(chain1_beta0,burnin = 1000, thin = 1)
chain1_beta1_thin<-thin_MCMC(chain1_beta1,burnin = 1000, thin = 1)
chain1_beta2_thin<-thin_MCMC(chain1_beta2,burnin = 1000, thin = 1)
chain1_psi_thin<-thin_MCMC(chain1_psi,burnin = 1000, thin = 1)
chain1_tau_thin<-thin_MCMC(chain1_tau,burnin = 1000, thin = 1)
chain2_beta0_thin<-thin_MCMC(chain2_beta0,burnin = 1000, thin = 1)
chain2_beta1_thin<-thin_MCMC(chain2_beta1,burnin = 1000, thin = 1)
chain2_beta2_thin<-thin_MCMC(chain2_beta2,burnin = 1000, thin = 1)
chain2_psi_thin<-thin_MCMC(chain2_psi,burnin = 1000, thin = 1)
chain2_tau_thin<-thin_MCMC(chain2_tau,burnin = 1000, thin = 1)
chain3_beta0_thin<-thin_MCMC(chain3_beta0,burnin = 1000, thin = 1)
chain3_beta1_thin<-thin_MCMC(chain3_beta1,burnin = 1000, thin = 1)
chain3_beta2_thin<-thin_MCMC(chain3_beta2,burnin = 1000, thin = 1)
chain3_psi_thin<-thin_MCMC(chain3_psi,burnin = 1000, thin = 1)
chain3_tau_thin<-thin_MCMC(chain3_tau,burnin = 1000, thin = 1)

# saving parallel chains
Beta0<- list(chain1_beta0_thin,chain2_beta0_thin,chain3_beta0_thin)
Beta1<- list(chain1_beta1_thin,chain2_beta1_thin,chain3_beta1_thin)
Beta2<- list(chain1_beta2_thin,chain2_beta2_thin,chain3_beta2_thin)
psi<-list(chain1_psi_thin,chain2_psi_thin,chain3_psi_thin)
tau<- list(chain1_tau_thin,chain2_tau_thin,chain3_tau_thin)

# checking convergence
library(coda)
library(mcmcplots)
Beta0.mcmc<-convert.mcmc.list(Beta0)
Beta1.mcmc<-convert.mcmc.list(Beta1)
Beta2.mcmc<-convert.mcmc.list(Beta2)
tau.mcmc<-convert.mcmc.list(tau)
psi.mcmc<-convert.mcmc.list(psi)
g1<-gelman.diag(Beta0.mcmc)
g2<-gelman.diag(Beta1.mcmc)
g3<-gelman.diag(Beta2.mcmc)
g4<-gelman.diag(tau.mcmc)
#g5<-gelman.diag(psi.mcmc)

# combining all chains to calculate summary and densities
Beta0_all<- c(chain1_beta0_thin,chain2_beta0_thin,chain3_beta0_thin)
Beta1_all<-c(chain1_beta1_thin,chain2_beta1_thin,chain3_beta1_thin)
Beta2_all<-c(chain1_beta2_thin,chain2_beta2_thin,chain3_beta2_thin)
tau_all<- c(chain1_tau_thin,chain2_tau_thin,chain3_tau_thin)
psi_all<-list()
for(i in 1:2148){
  psi_i<- c(chain1_psi_thin[i,],chain2_psi_thin[i,],chain3_psi_thin[i,])
  psi_all[[i]]<- psi_i
}
#psi1_all<-c(chain1_psi_thin,chain2_psi_thin,chain3_psi_thin)
#psi56_all<-c(chain1_psi_thin,chain2_psi_thin,chain3_psi_thin)

#saving results for later use
SBEL_ind_all_lung_male<-list(Beta0_all,Beta1_all,Beta2_all,tau_all,psi_all)
SBEL_ind_mcmc_lung_male<-list(Beta0.mcmc,Beta1.mcmc,Beta2.mcmc,tau.mcmc,psi.mcmc)
save(SBEL_ind_all_lung_male,file="Results/SBEL_ind_all_lung_male.RData")
save(SBEL_ind_mcmc_lung_male,file="Results/SBEL_ind_mcmc_lung_male.RData")

out<-data.frame(Paramter=c("Intercept", "Beta1(cities)", "Beta2(regional)","Precision"),
                Median=c(median(Beta0_all),median(Beta1_all),median(Beta2_all),median(tau_all)),
                `2.5% quantile`= c(quantile(Beta0_all,0.025),quantile(Beta1_all,0.025),quantile(Beta2_all,0.025),quantile(tau_all,0.025)),
                `97.5% quantile`= c(quantile(Beta0_all,0.975),quantile(Beta1_all,0.975),quantile(Beta2_all,0.975),quantile(tau_all,0.975)),
                `Gelman_Rubin diagnostic`= round(c(g1[[1]][1],g2[[1]][1],g3[[1]][1],g4[[1]][1]),2))
knitr::kable(out,row.names = F,format="latex")


# calculation of WAIC
source("Rscripts/waic.R")
Beta_ind_SBEL<- rbind(SBEL_ind_all_lung_male[[1]],SBEL_ind_all_lung_male[[2]],SBEL_ind_all_lung_male[[3]])
psi_ind_SBEL<-matrix(c(SBEL_ind_all_lung_male[[5]][[1]]),nrow=27000, ncol=1)
for(i in 2:2148){
  psi_ind_SBEL<-cbind(psi_ind_SBEL,SBEL_ind_all_lung_male[[4]][[i]])
}
tau_ind_BEL<-SBEL_ind_all_lung_male[[4]]
theta<-t(Beta_ind_SBEL)%*%t(x)+psi_ind_SBEL
#pred_BEL_ind<-colMeans(theta)
WAIC_ind_BEL<-get.WAIC.BEL(theta=theta,y=y,x=x)

# Calculation of rank and probabilities
#ranking theta's for all iterations
regional_mean_output<-data.frame(mean_major_cities=exp(SBEL_ind_all_lung_male[[2]]),
                                 mean_regional=exp(SBEL_ind_all_lung_male[[3]]),
                                 mean_remotes=exp(SBEL_ind_all_lung_male[[1]]))


rank=matrix(0,nrow=dim(regional_mean_output)[1],ncol=dim(regional_mean_output)[2])

for(i in 1:dim(regional_mean_output)[1])
{
  r=rank(regional_mean_output[i,])
  rank[i,]=r
}
rank_theta<-as.data.frame(rank)
rank_sum<- data.frame("remoteness category"=c("major cities","inner and outer regional","remote"),
                      "median rank"= c(median(rank_theta$V1),median(rank_theta$V2),median(rank_theta$V3)),
                      "95% CI-lower" = c(quantile(rank_theta$V1,0.025),quantile(rank_theta$V2,0.025),
                                         quantile(rank_theta$V3,0.025)) ,
                      "95% CI-upper" = c(quantile(rank_theta$V1,0.975),quantile(rank_theta$V2,0.975),
                                         quantile(rank_theta$V3,0.975)))
knitr::kable(rank_sum,format="latex")

# calculation of probabilities
step<-function(x,y){
  value<-c()
  for(i in 1:length(x))
  {
    value[i]<-ifelse(x[i]>y[i],1,0)
  }
  return(value)
}
mean_output<-regional_mean_output
city_regional<-step(mean_output$mean_major_cities,mean_output$mean_regional)
prob_city_regional<-summary(as.factor(city_regional))[2]/length(city_regional)
city_remote<-step(mean_output$mean_major_cities,mean_output$mean_remote)
prob_city_remote<-summary(as.factor(city_remote))[2]/length(city_remote)
regional_remote<-step(mean_output$mean_regional,mean_output$mean_remote)
prob_regional_remote<-summary(as.factor(regional_remote))[2]/length(regional_remote)
pairs<-data.frame(pairs=c("cities>regional","cities>remote","regional>remote"),
                  Probability=c(prob_city_regional,prob_city_remote,prob_regional_remote))
knitr::kable(pairs,caption="Pairwise Comparison of region_specific means",format="latex")

# Posterior mean difference
city_regional<-c(mean_output$mean_major_cities-mean_output$mean_regional)
city_remote<- c(mean_output$mean_major_cities-mean_output$mean_remote)
regional_remote<-c(mean_output$mean_regional-mean_output$mean_remote)

mean<- c(mean(city_regional),mean(regional_remote),mean(city_remote))
CI_lower<-c(quantile(city_regional,0.025),quantile(regional_remote,0.025),
            quantile(city_remote,0.025))
CI_upper<-c(quantile(city_regional,0.975),quantile(regional_remote,0.975),
            quantile(city_remote,0.975))
post_mean_diff<- data.frame(pairs=c("major cities-regional","regional-remote","major cities-remote"),
                            "Posterior mean difference"= mean, "95%CI(lower)"= CI_lower,
                            "95%CI(upper)"= CI_upper)
knitr::kable(post_mean_diff, format="latex")

# relative difference with observed data
#cancer 10
load("Results/Beta 23_1.RData")

regional_mean_output_lung<-data.frame(Major_cities=exp(beta[,1]), Regional=exp(beta[,2]),
                                      Remote=exp(beta[,3]))

load("Results/SBEL_ind_all_lung_male.RData")
regional_mean_output_lung_meta<-data.frame(Major_cities=exp(SBEL_ind_all_lung_male[[2]]),
                                           Regional=exp(SBEL_ind_all_lung_male[[3]]),
                                           Remote=exp(SBEL_ind_all_lung_male[[1]]))
diff<-regional_mean_output_lung-regional_mean_output_lung_meta[17001:27000,]
summary(diff)
relative_diff<- (diff/regional_mean_output_lung)*100 # giving very bad results
summary(relative_diff)
