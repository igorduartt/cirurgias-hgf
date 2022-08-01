install.packages("devtools")
install.packages("remotes")
devtools::install_github("fulvionedel/csapAIH")
remotes::install_github("rfsaldanha/microdatasus")
my_packages <- c("glue","rtweet","WikidataQueryServiceR", "microdatasus", 
                 "csapAIH", "dplyr", "shiny", "bslib", "shinythemes")
install_if_missing <- function(p) {
  if(p %in% rownames(installed.packages())==FALSE){
    install.packages(p)}
}
invisible(sapply(my_packages, install_if_missing))

