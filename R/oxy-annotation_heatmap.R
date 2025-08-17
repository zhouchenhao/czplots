
#' @title Plot gene expression heatmap for each cluster
#' @description FUNCTION_DESCRIPTION
#' @param data A Seurat object
#' @param gene a list of genes for heatmap
#' @param group the name of meta.data column that you want to split the dataset for comparison
#' @return A heatmap plot showing mean expression of each gene in each group or percentage of cells that have no-zero expression of each gene in each group
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname annotation_heatmap
#' @export 
annotation_heatmap <- function(data,gene,group){
expr_matrix <- Seurat::GetAssayData(data, assay = "RNA", slot = "data")
expr_matrix<-as.data.frame(expr_matrix)
Matrix_2<-expr_matrix[gene, ]
a<-unique(data@meta.data[,group])
a<-levels(a)
Matrix_final_mean<-as.data.frame(rep(0,length(gene)))
Matrix_final_percent<-as.data.frame(rep(0,length(gene)))
for (i in 1:length(a)) {
  a1<-a[i]
  p<-data@meta.data[,group]==a1
  cells<-rownames(data@meta.data)[p]
  p<-match(cells,colnames(Matrix_2))
  Matrix_3<-Matrix_2[,p]
  Matrix_3[,"mean"]<-rep(0,nrow(Matrix_3))
for(i in 1:nrow(Matrix_3)) {
b<-as.numeric(as.character(Matrix_3[i,-ncol(Matrix_3)]))
Matrix_3[i,"mean"]<-sum(b)/length(b)
p<-match(cells,colnames(Matrix_2))
  Matrix_4<-Matrix_2[,p]
  Matrix_4[,"percentage"]<-rep(0,nrow(Matrix_4))
}
Matrix_3_mean<-Matrix_3[,ncol(Matrix_3)]
Matrix_final_mean<-cbind(Matrix_final_mean,Matrix_3_mean)
for(i in 1:nrow(Matrix_4)) {
b<-as.numeric(as.character(Matrix_4[i,-ncol(Matrix_4)]))
Matrix_4[i,"percentage"]<-(length(b[b>0])/length(b)*100)
}
Matrix_4_percent<-Matrix_4[,ncol(Matrix_4)]
Matrix_final_percent<-cbind(Matrix_final_percent,Matrix_4_percent)
}
Matrix_combined_mean<-Matrix_final_mean[,-1]
rownames(Matrix_combined_mean)<-gene
colnames(Matrix_combined_mean)<-a
Matrix_combined_mean2<-t(scale(t(Matrix_combined_mean)))
pheatmap::pheatmap(Matrix_combined_mean2,color = c("#3690c0","#74a9cf", "#fdd49e", "#fc8d59","#ef6548", "#d7301f", "#b30000", "#7f0000"), border_color="white",cluster_rows=F,cluster_cols=F,breaks = c(-1,-0.5,0,0.5,1,1.5,2),legend_breaks =c(-1,-0.5,0,0.5,1,1.5,2),angle_col = c("45"),main = "Mean gene expression per group")

Matrix_combined_percent<-Matrix_final_percent[,-1]
rownames(Matrix_combined_percent)<-gene
colnames(Matrix_combined_percent)<-a
pheatmap::pheatmap(Matrix_combined_percent,color = c("#3690c0","#74a9cf", "#fdd49e", "#fc8d59","#ef6548", "#d7301f", "#b30000", "#7f0000"), border_color="white",cluster_rows=F,cluster_cols=F,breaks = c(0,1,10,20,30,50,80,100),legend_breaks =c(0,1,10,20,30,50,80,100),angle_col = c("45"),main = "Percentage of cells per group")

} 






