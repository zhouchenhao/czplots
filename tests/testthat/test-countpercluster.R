

data("skin_tcell", package = "czplots")



test_that("no error in fitting countpercluster for the skin_tcell data", {
fit <- countpercluster(data=skin_tcell,group="tissue",level=unique(skin_tcell@meta.data$tissue))
 expect_true(inherits(fit,c("matrix","array")))

})
