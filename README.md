
<!-- README.md is generated from README.Rmd. Please edit that file -->

# czplots

<!-- badges: start -->
<!-- badges: end -->

This R package provides wrapped and customized functions for fast and
intuitive analysis of scRNA-seq data. It simplifies common tasks, such
as identifying enriched cell types, gene pathways and ligand–receptor
interactions. Researchers can generate insightful plots quickly without
extensive coding. The goal is to save time and let users focus on
interpreting biology behind the data.

Perfect for researchers who want to generate plots with a single line!

## Installation

You can install the development version of czplots from
[GitHub](https://github.com/) with:

``` r
install.packages("pak")
pak::pak("zhouchenhao/czplots")
```

## Usage instructions

``` r
library(czplots)

#load test dataset
data(skin_tcell)

#calculate compositional change for each cell cluster between two experimental groups and return a table and bar charts
countpercluster(skin_tcell,group = "tissue")

#plot heatmap to visualize expression of provided key markers in each cell cluster or experimental group
annotation_heatmap(skin_tcell,gene = c("Cd44","Cd69"), group = "seurat_clusters")
```

## Vignette

For detailed explanation of each package function, please go to the
[vignette](https://zhouchenhao.github.io/czplots/articles/Introduction-to-czplots.html)
for more information and examples.
