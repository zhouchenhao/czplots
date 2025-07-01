
<!-- README.md is generated from README.Rmd. Please edit that file -->

# czplots

<!-- badges: start -->
<!-- badges: end -->

Wrapped functions in R to plot scRNAseq data quickly

## Installation

You can install the development version of czplots from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("zhouchenhao/czplots")
```

## Example

There are some basic usages:

``` r
library(czplots)

#annotation_heatmap(seurat_object,gene = c("Cd44","Cd69"),group = "seurat_clusters") 
#plot heatmap showing the expression patterns of cell-type associated markers in each group of interest.
#countpercluster(seurat_object,group = "disease") 
#calculate cell number in each group of interest and plot percentage of total using bar chart.
```
