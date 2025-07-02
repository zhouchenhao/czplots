
library(Seurat)
skin_tcell<-readRDS("/Users/chenhaozhou/Desktop/Project/Building_R_packages/CZanalyse/data-raw/skin.integrated_Tcell_TCR.RDS")

save(skin_tcell, file = "/Users/chenhaozhou/Desktop/Project/Building_R_packages/CZanalyse/data/skin_tcell.RData")