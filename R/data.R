
#' Skin T cell Data
#'
#' @description Zhou et al (2021) give a scRNAseq dataset containing 5028 TCR+ T cells derived from mouse skin. The dataset was downsampled to 2000 cells.
#'
#' @format this dataset contains T cells from K14E7 trangenic mice and wildtype C57BL/6 mice. We will use 2 metadata columns:
#' \describe{
#'   \item{seurat_clusters}{cluster ID, "0 1 2 3 4 5 6 7 8"}
#'   \item{tissue}{mouse genotype, "skin_E7g" or "skin_C57g"}
#' }
#' @source \url{https://0-www-ncbi-nlm-nih-gov.brum.beds.ac.uk/geo/query/acc.cgi?acc=GSE156745}
#' skin_tcell
"skin_tcell"