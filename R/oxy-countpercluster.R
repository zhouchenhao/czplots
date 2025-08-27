#' @title count cell numbers per each cluster for each group 
#' @description This function quickly calculates and visualizes cell numbers and their percentages in each cluster for each group.  
#' @param data A Seurat object
#' @param group the name of metadata column within the Seurat object that indicate groups you want to make comparison
#' @param level the order of group names you want in your plot
#' @return A table containing cell numbers in each cluster for each group. Bar charts showing percentage of cell type in each group. 
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  countpercluster(skin_tcell,group = "tissue",level=unique(skin_tcell@meta.data$tissue))
#'  }
#' }
#' @rdname countpercluster
#' @export 
countpercluster <- function(data,group,level){
  p<-match(group,colnames(data@meta.data))
  a0<-data@meta.data[,p]
  count<-NULL
  cluster<-sort(unique(data@meta.data$seurat_clusters))
  for(i in 1:length(cluster)) {
    a<-data@meta.data[data@meta.data$seurat_clusters==cluster[i],]
    b<-NULL
    for(j in 1:length(unique(a0))) {
      b1<-nrow(a[a[,group]==unique(a0)[j],])
      b<-c(b,b1)
    }
    count<-rbind(count,b)
  }
  rownames(count)<-paste("C",cluster,sep="")
  colnames(count)<-unique(a0)
  total<-colSums(count)
  count<-rbind(count,total)
  
  percent<-NULL
  for(k in 1:ncol(count)) {
    a<-round(count[,k]/count[nrow(count),k]*100,digits=2)
    percent<-cbind(percent,a)
  }
  colnames(percent)<-paste(unique(a0),"percent",sep="_")
  count<-cbind(count,percent)
  
  count2<-count[1:(nrow(count)-1),((ncol(count)/2)+1):ncol(count)]
  colnames(count2)<-unique(a0)
  count_plot<-NULL
  for(h in 1:ncol(count2)) {
    count3<-count2[,h]
    N<-rep(colnames(count2)[h],length(count3))
    count3<-as.data.frame(t(rbind(count3,N)))
    count_plot<-rbind(count_plot,count3)
  }
  colnames(count_plot)<-c("percentage",group)
  count_plot$seurat_cluster<-rep(paste("C",cluster,sep=""),length(unique(a0)))
  count_plot$percentage<-as.numeric(count_plot$percentage)
  
  my_plot<-ggplot2::ggplot(data=count_plot,  ggplot2::aes(x=seurat_cluster, y=percentage, fill=factor(count_plot[,group],levels = level))) +
    ggplot2::geom_bar(width=0.7, position=ggplot2::position_dodge(width=0.75), stat="identity") +
    ggplot2::labs(y = "Percentage (%)", fill=group) + ggplot2::scale_fill_manual(values = rainbow(length(unique(a0))))+
    ggplot2::theme_bw() + ggplot2::theme(panel.grid.minor.x=ggplot2::element_blank(), panel.grid.major.x=ggplot2::element_blank(), plot.title = ggplot2::element_text(hjust = 0.5)) 
  print(my_plot)
  return(count)
}
