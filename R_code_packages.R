############################################
# Install and load required packages for Rmd
############################################

# --- Helper function ---
install_if_missing <- function(pkgs) {
  new_pkgs <- pkgs[!(pkgs %in% installed.packages()[,"Package"])]
  if(length(new_pkgs)) install.packages(new_pkgs, dependencies = TRUE)
}

# --- CRAN packages ---
cran_packages <- c(
  "dplyr",        # Data manipulation
  "readxl",       # Read Excel files
  "ggplot2",      # Graphics
  "RColorBrewer", # Color palettes
  "pheatmap",     # Heatmaps
  "vegan",        # ordination
  "stringr",      # String operations
  "gridExtra",    # Arrange multiple plots
  "readr",        # Read tabular data
  "modeest",      # Mode estimation
  "eulerr",       # Venn/Euler diagrams
  "devtools",     # For installing from GitHub
  "knitr",        # For R Markdown
  "rmarkdown"     # For rendering Rmd files
)

install_if_missing(cran_packages)


# --- Bioconductor packages ---
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

bioc_packages <- c(
  "dada2", 
  "Biostrings", 
  "ShortRead", 
  "phyloseq", 
  "microbiome", 
  "ANCOMBC"
)

for (pkg in bioc_packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    BiocManager::install(pkg, ask = FALSE, update = TRUE)
  }
}


# --- GitHub packages ---
if (!requireNamespace("devtools", quietly = TRUE)) install.packages("devtools")

github_packages <- c(
  "zhouhj1994/LinDA", 
  "statdivlab/radEmu"
)

for (pkg in github_packages) {
  devtools::install_github(pkg, upgrade = "never")
}


# --- Load all packages ---
all_packages <- c(cran_packages, bioc_packages, "LinDA", "radEmu")
invisible(lapply(all_packages, library, character.only = TRUE))


