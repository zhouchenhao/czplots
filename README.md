
<!-- README.md is generated from README.Rmd. Please edit that file -->

# czplots

<!-- badges: start -->
<!-- badges: end -->

R package to help analyze and visualize scRNA-seq data using wrapped and
customized functions

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
data(skin_tcell)

countpercluster(skin_tcell,group = "tissue")
annotation_heatmap(skin_tcell,gene = c("Cd44","Cd69"), group = "seurat_clusters")
```

## Vignette

For detailed explanation of each package function, please go to the
[vignette](https://zhouchenhao.github.io/czplots/blob/main/docs/articles/Introduction.html)
for more information and examples.

📖 [Read the full vignette
here](https://zhouchenhao.github.io/czplots/articles/Introduction.html)
