
data("skin_tcell", package = "czplots")

test_that("no error in fitting annotation_heatmap for the skin_tcell data", {
	fit <- annotation_heatmap(data=skin_tcell,gene=c("Cd44","Cd69","Itgae","Ccr7","Il7r","Tbx21","Ifng","Il2","Gata3","Il4","Il5","Foxp3","Ctla4","Pdcd1","Tigit","Il2ra","Gzmb","Il10","Il17a","Cxcr5","Bcl6","Cd8a","Cd4"),group="seurat_clusters")

  expect_true(inherits(fit,"pheatmap"))

})

