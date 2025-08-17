
# clean data ----
skin_tcell<-Seurat::readRDS("/Users/chenhaozhou/Desktop/Project/Building_R_packages/czplots/czplots_github/czplots/data-raw/skin.integrated_Tcell_TCR.rds")
skin_tcell<-Seurat::UpdateSeuratObject(skin_tcell)
skin_tcell <- skin_tcell[, sample(colnames(skin_tcell), size = 2000, replace=F)]

# write data in correct format to data folder ----
usethis::use_data(skin_tcell, overwrite = TRUE)
