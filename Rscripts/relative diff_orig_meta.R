
#loading all the beta outputs and taking exp for calculating SIRs

#cancer1
library(tidyverse)
load("Beta 64_1.RData")

regional_mean_output_all<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))



rm(beta)
load("all_male.RData")
regional_mean_output_all_meta<-data.frame(Major_cities=mean(exp(samples_all_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                 Regional=mean(exp(samples_all_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                 Remote=mean(exp(samples_all_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_all_cancer_model_region_final)
load("Beta 64_2.RData")

regional_mean_output_all_f<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("all_female.RData")
regional_mean_output_all_meta_f<-data.frame(Major_cities=mean(exp(samples_all_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                          Regional=mean(exp(samples_all_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                          Remote=mean(exp(samples_all_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_all_cancer_model_region_final)
#cancer 2
load("Beta 45_1.RData")

regional_mean_output_brain<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("brain_male.RData")
regional_mean_output_brain_meta<-data.frame(Major_cities=mean(exp(samples_brain_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                          Regional=mean(exp(samples_brain_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                          Remote=mean(exp(samples_brain_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_brain_cancer_model_region_final)
load("Beta 45_2.RData")

regional_mean_output_brain_f<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("brain_female.RData")
regional_mean_output_brain_meta_f<-data.frame(Major_cities=mean(exp(samples_brain_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                            Regional=mean(exp(samples_brain_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                            Remote=mean(exp(samples_brain_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_brain_cancer_model_region_final)
#cancer 3
load("Beta 33_2.RData")

regional_mean_output_breast_f<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("breast.RData")
regional_mean_output_breast_meta_f<-data.frame(Major_cities=mean(exp(samples_breast_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                            Regional=mean(exp(samples_breast_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                            Remote=mean(exp(samples_breast_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_breast_cancer_model_region_final)
#cancer 4
load("Beta 35_2.RData")

regional_mean_output_cervical_f<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("cervical_female.RData")
regional_mean_output_cervical_meta_f<-data.frame(Major_cities=mean(exp(samples_cervical_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                            Regional=mean(exp(samples_cervical_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                            Remote=mean(exp(samples_cervical_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_cervical_cancer_model_region_final)

#cancer 5
load("Beta 14_1.RData")

regional_mean_output_bowel<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("colorectal.RData")
regional_mean_output_colorectal_meta<-data.frame(Major_cities=mean(exp(samples_colorectal_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                            Regional=mean(exp(samples_colorectal_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                            Remote=mean(exp(samples_colorectal_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_colorectal_cancer_model_region_final)
load("Beta 14_2.RData")

regional_mean_output_bowel_f<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("colorectal_female.RData")
regional_mean_output_colorectal_meta_f<-data.frame(Major_cities=mean(exp(samples_colorectal_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                              Regional=mean(exp(samples_colorectal_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                              Remote=mean(exp(samples_colorectal_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_colorectal_cancer_model_region_final)

#cancer 6
load("Beta 71_1.RData")

regional_mean_output_head_neck<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("head_neck_male.RData")
regional_mean_output_head_neck_meta<-data.frame(Major_cities=mean(exp(samples_head_neck_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                            Regional=mean(exp(samples_head_neck_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                            Remote=mean(exp(samples_head_neck_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_head_neck_cancer_model_region_final)
load("Beta 71_2.RData")

regional_mean_output_head_neck_f<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("head_neck_female.RData")
regional_mean_output_head_neck_meta_f<-data.frame(Major_cities=mean(exp(samples_head_neck_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                              Regional=mean(exp(samples_head_neck_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                              Remote=mean(exp(samples_head_neck_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_head_neck_cancer_model_region_final)


#cancer 7
load("Beta 42_1.RData")

regional_mean_output_kidney<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("kidney_male.RData")
regional_mean_output_kidney_meta<-data.frame(Major_cities=mean(exp(samples_kidney_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                            Regional=mean(exp(samples_kidney_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                            Remote=mean(exp(samples_kidney_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_kidney_cancer_model_region_final)
load("Beta 42_2.RData")

regional_mean_output_kidney_f<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("kidney_female.RData")
regional_mean_output_kidney_meta_f<-data.frame(Major_cities=mean(exp(samples_kidney_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                              Regional=mean(exp(samples_kidney_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                              Remote=mean(exp(samples_kidney_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_kidney_cancer_model_region_final)

#cancer 8
load("Beta 54_1.RData")

regional_mean_output_leukaemia<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("leukaemia_male.RData")
regional_mean_output_leukaemia_meta<-data.frame(Major_cities=mean(exp(samples_leukaemia_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                            Regional=mean(exp(samples_leukaemia_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                            Remote=mean(exp(samples_leukaemia_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_leukaemia_cancer_model_region_final)
load("Beta 54_2.RData")

regional_mean_output_leukaemia_f<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("leukaemia_female.RData")
regional_mean_output_leukaemia_meta_f<-data.frame(Major_cities=mean(exp(samples_leukaemia_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                              Regional=mean(exp(samples_leukaemia_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                              Remote=mean(exp(samples_leukaemia_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_leukaemia_cancer_model_region_final)

#cancer 9
load("Beta 18_1.RData")

regional_mean_output_liver<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("liver_male.RData")
regional_mean_output_liver_meta<-data.frame(Major_cities=mean(exp(samples_liver_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                            Regional=mean(exp(samples_liver_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                            Remote=mean(exp(samples_liver_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_liver_cancer_model_region_final)
load("Beta 18_2.RData")

regional_mean_output_liver_f<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("liver_female.RData")
regional_mean_output_liver_meta_f<-data.frame(Major_cities=mean(exp(samples_liver_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                              Regional=mean(exp(samples_liver_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                              Remote=mean(exp(samples_liver_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_liver_cancer_model_region_final)


#cancer 10
load("Beta 23_1.RData")

regional_mean_output_lung<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("lung_male.RData")
regional_mean_output_lung_meta<-data.frame(Major_cities=mean(exp(samples_lung_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                            Regional=mean(exp(samples_lung_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                            Remote=mean(exp(samples_lung_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_lung_cancer_model_region_final)
load("Beta 23_2.RData")

regional_mean_output_lung_f<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("lung_female.RData")
regional_mean_output_lung_meta_f<-data.frame(Major_cities=mean(exp(samples_lung_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                              Regional=mean(exp(samples_lung_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                              Remote=mean(exp(samples_lung_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_lung_cancer_model_region_final)

#cancer 11
load("Beta 27_1.RData")

regional_mean_output_melanoma<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("melanoma_male.RData")
regional_mean_output_melanoma_meta<-data.frame(Major_cities=mean(exp(samples_melanoma_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                            Regional=mean(exp(samples_melanoma_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                            Remote=mean(exp(samples_melanoma_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_melanoma_cancer_model_region_final)
load("Beta 27_2.RData")

regional_mean_output_melanoma_f<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("melanoma_female.RData")
regional_mean_output_melanoma_meta_f<-data.frame(Major_cities=mean(exp(samples_melanoma_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                              Regional=mean(exp(samples_melanoma_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                              Remote=mean(exp(samples_melanoma_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_melanoma_cancer_model_region_final)


#cancer 12
load("Beta 60_1.RData")

regional_mean_output_myeloma<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("myeloma_male.RData")
regional_mean_output_myeloma_meta<-data.frame(Major_cities=mean(exp(samples_myeloma_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                            Regional=mean(exp(samples_myeloma_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                            Remote=mean(exp(samples_myeloma_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_myeloma_cancer_model_region_final)
load("Beta 60_2.RData")

regional_mean_output_myeloma_f<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("myeloma_female.RData")
regional_mean_output_myeloma_meta_f<-data.frame(Major_cities=mean(exp(samples_myeloma_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                              Regional=mean(exp(samples_myeloma_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                              Remote=mean(exp(samples_myeloma_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_myeloma_cancer_model_region_final)

#canncer 13
load("Beta 53_1.RData")

regional_mean_output_nh_lymph<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("nh_lymph_male.RData")
regional_mean_output_nh_lymph_meta<-data.frame(Major_cities=mean(exp(samples_nh_lymph_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                            Regional=mean(exp(samples_nh_lymph_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                            Remote=mean(exp(samples_nh_lymph_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_nh_lymph_cancer_model_region_final)
load("Beta 53_2.RData")

regional_mean_output_nh_lymph_f<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("nh_lymph_female.RData")
regional_mean_output_nh_lymph_meta_f<-data.frame(Major_cities=mean(exp(samples_nh_lymph_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                              Regional=mean(exp(samples_nh_lymph_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                              Remote=mean(exp(samples_nh_lymph_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_nh_lymph_cancer_model_region_final)

#cancer 14
load("Beta 11_1.RData")

regional_mean_output_ospg<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("ospg_male.RData")
regional_mean_output_ospg_meta<-data.frame(Major_cities=mean(exp(samples_ospg_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                            Regional=mean(exp(samples_ospg_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                            Remote=mean(exp(samples_ospg_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_ospg_cancer_model_region_final)
load("Beta 11_2.RData")

regional_mean_output_ospg_f<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("ospg_female.RData")
regional_mean_output_ospg_meta_f<-data.frame(Major_cities=mean(exp(samples_ospg_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                              Regional=mean(exp(samples_ospg_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                              Remote=mean(exp(samples_ospg_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_ospg_cancer_model_region_final)


#cancer 15
load("Beta 37_2.RData")

regional_mean_output_ovarian_f<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("ovarian.RData")
regional_mean_output_ovarian_meta_f<-data.frame(Major_cities=mean(exp(samples_ovarian_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                              Regional=mean(exp(samples_ovarian_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                              Remote=mean(exp(samples_ovarian_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_ovarian_cancer_model_region_final)

#cancer 16
load("Beta 20_1.RData")

regional_mean_output_pncr<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("pncr_male.RData")
regional_mean_output_pncr_meta<-data.frame(Major_cities=mean(exp(samples_pncr_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                           Regional=mean(exp(samples_pncr_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                           Remote=mean(exp(samples_pncr_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_pncr_cancer_model_region_final)
load("Beta 20_2.RData")

regional_mean_output_pncr_f<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("pncr_female.RData")
regional_mean_output_pncr_meta_f<-data.frame(Major_cities=mean(exp(samples_pncr_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                             Regional=mean(exp(samples_pncr_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                             Remote=mean(exp(samples_pncr_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_pncr_cancer_model_region_final)

#cancer 17
load("Beta 39_1.RData")

regional_mean_output_prostate<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("prostate.RData")
regional_mean_output_prostate_meta<-data.frame(Major_cities=mean(exp(samples_prostate_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                            Regional=mean(exp(samples_prostate_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                            Remote=mean(exp(samples_prostate_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_prostate_cancer_model_region_final)

#cancer 18
load("Beta 12_1.RData")

regional_mean_output_stomach<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("stomach_male.RData")
regional_mean_output_stomach_meta<-data.frame(Major_cities=mean(exp(samples_stomach_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                           Regional=mean(exp(samples_stomach_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                           Remote=mean(exp(samples_stomach_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_stomach_cancer_model_region_final)
load("Beta 12_2.RData")

regional_mean_output_stomach_f<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("stomach_female.RData")
regional_mean_output_stomach_meta_f<-data.frame(Major_cities=mean(exp(samples_stomach_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                             Regional=mean(exp(samples_stomach_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                             Remote=mean(exp(samples_stomach_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_stomach_cancer_model_region_final)
#cancer 19
load("Beta 48_1.RData")

regional_mean_output_thyroid<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("thyroid_male.RData")
regional_mean_output_thyroid_meta<-data.frame(Major_cities=mean(exp(samples_thyroid_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                           Regional=mean(exp(samples_thyroid_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                           Remote=mean(exp(samples_thyroid_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_thyroid_cancer_model_region_final)
load("Beta 48_2.RData")

regional_mean_output_thyroid_f<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("thyroid_female.RData")
regional_mean_output_thyroid_meta_f<-data.frame(Major_cities=mean(exp(samples_thyroid_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                             Regional=mean(exp(samples_thyroid_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                             Remote=mean(exp(samples_thyroid_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_thyroid_cancer_model_region_final)
#cancer 20
load("Beta 36_2.RData")

regional_mean_output_uterine_f<-data.frame(Major_cities=mean(exp(beta[,1])), Regional=mean(exp(beta[,2])), Remote=mean(exp(beta[,3])))
rm(beta)
load("uterine_female.RData")
regional_mean_output_uterine_meta_f<-data.frame(Major_cities=mean(exp(samples_uterine_cancer_model_region_final$BUGSoutput$sims.list$theta[,1])),
                                                Regional=mean(exp(samples_uterine_cancer_model_region_final$BUGSoutput$sims.list$theta[,2])),
                                                Remote=mean(exp(samples_uterine_cancer_model_region_final$BUGSoutput$sims.list$theta[,3])))
rm(samples_uterine_cancer_model_region_final)



#creating data frame of relative differences


cancers_male<-c("All","Bowel","Brain","Head and neck","Kidney","Leukaemia","Liver",
                "Lung","Melanoma","Myeloma","Non-Hodgkin lymphoma","Oesophageal","Pancreatic","Prostate",
                "Stomach","Thyroid")
cancers_male<-data.frame(cancers_male)
cancers_female<-c("All","Bowel","Brain","Breast","Cervical","Head and neck","Kidney","Leukaemia","Liver",
                  "Lung","Melanoma","Myeloma","Non-Hodgkin lymphoma","Oesophageal","Ovarian","Pancreatic",
                  "Stomach","Thyroid","Uterine")
cancers_female<-data.frame(cancers_female)
male_mean_SIR_orig<-bind_rows(regional_mean_output_all,regional_mean_output_bowel,regional_mean_output_brain,
                              regional_mean_output_head_neck,regional_mean_output_kidney,regional_mean_output_leukaemia,
                              regional_mean_output_liver,regional_mean_output_lung,regional_mean_output_melanoma,
                              regional_mean_output_myeloma,regional_mean_output_nh_lymph,regional_mean_output_ospg,regional_mean_output_pncr,
                              regional_mean_output_prostate,regional_mean_output_stomach,regional_mean_output_thyroid)


male_mean_SIR_orig<-bind_cols(cancers_male,male_mean_SIR_orig)
head(male_mean_SIR_orig)

male_mean_SIR_meta<-bind_rows(regional_mean_output_all_meta,regional_mean_output_colorectal_meta,regional_mean_output_brain_meta,
                              regional_mean_output_head_neck_meta,regional_mean_output_kidney_meta,regional_mean_output_leukaemia_meta,
                              regional_mean_output_liver_meta,regional_mean_output_lung_meta,regional_mean_output_melanoma_meta,
                              regional_mean_output_myeloma_meta,regional_mean_output_nh_lymph_meta,regional_mean_output_ospg_meta,
                              regional_mean_output_pncr_meta,regional_mean_output_prostate_meta,regional_mean_output_stomach_meta,regional_mean_output_thyroid_meta)


male_mean_SIR_meta<-bind_cols(cancers_male,male_mean_SIR_meta)
head(male_mean_SIR_meta)

male_SIR_diff<-data.frame(cancers_male)
male_SIR_diff<-mutate(male_SIR_diff,Major_cities=male_mean_SIR_meta$Major_cities-male_mean_SIR_orig$Major_cities)
male_SIR_diff<-mutate(male_SIR_diff,Regional=male_mean_SIR_meta$Regional-male_mean_SIR_orig$Regional)
male_SIR_diff<-mutate(male_SIR_diff,Remote=male_mean_SIR_meta$Remote-male_mean_SIR_orig$Remote)

male_SIR_diff<-mutate(male_SIR_diff,Relative_cities=
                        ((male_mean_SIR_meta$Major_cities-male_mean_SIR_orig$Major_cities)/male_mean_SIR_meta$Major_cities)*100)

male_SIR_diff<-mutate(male_SIR_diff,Relative_regional=
                        ((male_mean_SIR_meta$Regional-male_mean_SIR_orig$Regional)/male_mean_SIR_meta$Regional)*100)

male_SIR_diff<-mutate(male_SIR_diff,Relative_remote=
                        ((male_mean_SIR_meta$Remote-male_mean_SIR_orig$Remote)/male_mean_SIR_meta$Remote)*100)
male_SIR_diff
male_SIR_diff.df<-melt(male_SIR_diff)
male_SIR_diff.df<-rename(male_SIR_diff.df,c("variable"="Region"))
head(male_SIR_diff.df)

male_dif<-ggplot(data=male_SIR_diff.df,aes(x=cancers_male,y=value,color=Region))+geom_point(size=4)+
  labs(x="Cancer",y= "Posterior Mean Difference")+
  theme_bw()+
  theme(axis.text.x=element_text(angle=45,hjust=1),axis.text.y = element_text(),legend.position = c(0.9,0.85))#+
#labs(title="Posterior Mean Difference of SIR in Observed Data Model and Meta-analysis Model")


#female
female_mean_SIR_orig<-bind_rows(regional_mean_output_all_f,regional_mean_output_bowel_f,regional_mean_output_brain_f,
                              regional_mean_output_breast_f,regional_mean_output_cervical_f,
                              regional_mean_output_head_neck_f,regional_mean_output_kidney_f,regional_mean_output_leukaemia_f,
                              regional_mean_output_liver_f,regional_mean_output_lung_f,regional_mean_output_melanoma_f,
                              regional_mean_output_myeloma_f,regional_mean_output_nh_lymph_f,regional_mean_output_ospg_f,
                              regional_mean_output_ovarian_f,regional_mean_output_pncr_f,
                              regional_mean_output_stomach,regional_mean_output_thyroid,regional_mean_output_uterine_f)


female_mean_SIR_orig<-bind_cols(cancers_female,female_mean_SIR_orig)
head(female_mean_SIR_orig)

female_mean_SIR_meta<-bind_rows(regional_mean_output_all_meta_f,regional_mean_output_colorectal_meta_f,regional_mean_output_brain_meta_f,
                                regional_mean_output_breast_meta_f,regional_mean_output_cervical_meta_f,
                                regional_mean_output_head_neck_meta_f,regional_mean_output_kidney_meta_f,regional_mean_output_leukaemia_meta_f,
                                regional_mean_output_liver_meta_f,regional_mean_output_lung_meta_f,regional_mean_output_melanoma_meta_f,
                                regional_mean_output_myeloma_meta_f,regional_mean_output_nh_lymph_meta_f,regional_mean_output_ospg_meta_f,
                                regional_mean_output_ovarian_meta_f,regional_mean_output_pncr_meta_f,
                                regional_mean_output_stomach,regional_mean_output_thyroid,regional_mean_output_uterine_meta_f)


female_mean_SIR_meta<-bind_cols(cancers_female,female_mean_SIR_meta)
head(female_mean_SIR_meta)

female_SIR_diff<-data.frame(cancers_female)
female_SIR_diff<-mutate(female_SIR_diff,Major_cities=female_mean_SIR_meta$Major_cities-female_mean_SIR_orig$Major_cities)
female_SIR_diff<-mutate(female_SIR_diff,Regional=female_mean_SIR_meta$Regional-female_mean_SIR_orig$Regional)
female_SIR_diff<-mutate(female_SIR_diff,Remote=female_mean_SIR_meta$Remote-female_mean_SIR_orig$Remote)
female_SIR_diff.df<-melt(female_SIR_diff)
head(female_SIR_diff.df)
female_SIR_diff.df<-rename(female_SIR_diff.df,c("variable"="Region"))
female.diff<-ggplot(data=female_SIR_diff.df,aes(x=cancers_female,y=value,color=Region))+
  labs(x="Cancer",y= "Posterior Mean Difference")+
  geom_point(size=4)+theme_bw()+
  theme(axis.text.x=element_text(angle=45,hjust=1),axis.text.y = element_text(),legend.position = c(0.9,0.85))


female_SIR_diff<-mutate(female_SIR_diff,Relative_cities=
                        ((female_mean_SIR_meta$Major_cities-female_mean_SIR_orig$Major_cities)/female_mean_SIR_meta$Major_cities)*100)

female_SIR_diff<-mutate(female_SIR_diff,Relative_regional=
                        ((female_mean_SIR_meta$Regional-female_mean_SIR_orig$Regional)/female_mean_SIR_meta$Regional)*100)

female_SIR_diff<-mutate(female_SIR_diff,Relative_remote=
                        ((female_mean_SIR_meta$Remote-female_mean_SIR_orig$Remote)/female_mean_SIR_meta$Remote)*100)



