
<!-- README.md is generated from README.Rmd. Please edit that file -->

# shine

[![](https://img.shields.io/badge/platforms-linux%20%7C%20osx%20-2a89a1.svg)]()
[![](https://img.shields.io/badge/lifecycle-stable-4ba598.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![](https://img.shields.io/github/last-commit/montilab/shine.svg)](https://github.com/montilab/shine/commits/master)

Bayesian **S**tructure Learning for **Hi**erarchical **Ne**tworks  
*A package to aid in the Bayesian estimation of hierarchical biological
regulatory networks via Gaussian graphical modeling*

## Documentation

Please visit <https://montilab.github.io/shine/> for comprehensive
documentation.

## Requirements

To install directly from Github, R (\>= 3.5.0) is required. For
workflows, Nextflow can be used on any POSIX compatible system (Linux,
OS X, etc) and requires BASH and Java 8 (or higher) to be installed.
Alternatively, check out usage with Docker.

## Installation

Install the development version of the package from Github.

``` r
devtools::install_github("montilab/shine")
```

## Basic Overview

``` r
library(shine)
```

## Constraint-Based Structure Learning

``` r
# Toy expression set object
data(toy)

# Filter out non-varying genes
genes.filtered <- filter.var(toy, column="subtype", subtypes=c("A", "B", "C"))

# Select top genes by median absolute deviation
genes.selected <- select.var(toy, column="subtype", subtypes=c("A", "B", "C"), limit=30)

# Find constraints for structure with zero-order correlations
mods <- mods.get(toy, min.size=5, cores=3, do.plot=FALSE)
meta <- metanet.build(mods$eigengenes, cut=0.5, mpl=TRUE, iter=20000, cores=3)

# Set constraints
blanket <- blanket.new(mods$genes)
blanket <- blanket.add.mods(blanket, mods$mods)
blanket <- blanket.add.modpairs(blanket, mods$mods, meta$metanet.edges)

# Learn network
bdg <- bdgraph.mpl(data=t(exprs(toy)), 
                   g.prior=blanket, 
                   method="ggm", 
                   iter=10000,
                   cores=3)
```

## Hierarchical Network Workflows

``` r
# Data paths
path.eset <- system.file("extdata/eset.rds", package="shine")
path.genes <- system.file("extdata/genes.rds", package="shine")
path.blanket <- system.file("extdata/blanket.rds", package="shine")

condition <- "subtype"

# Learn networks as a hierarchy
hierarchy <- "
A_B_C -> A_B
A_B_C -> C
A_B -> A
A_B -> B
"

# Generate workflow
build.workflow(hierarchy,
               condition,
               path.eset,
               path.genes,
               path.blanket,
               iters=10000,
               cores=3)
```

``` bash
# Run workflow
./nextflow hierarchy.nf -c hierarchy.config -profile local
```

``` md
N E X T F L O W  ~  version 19.10.0
Launching `hierarchy.nf` [hungry_banach] - revision: 75ab3c736b
-
P I P E L I N E ~ Configuration
===============================
eset      : /Library/Frameworks/R.framework/Versions/3.6/Resources/library/shine/extdata/eset.rds
genes     : /Library/Frameworks/R.framework/Versions/3.6/Resources/library/shine/extdata/genes.rds
blanket   : /Library/Frameworks/R.framework/Versions/3.6/Resources/library/shine/extdata/blanket.rds
outdir    : .
iters     : 10000
cores     : 3
condition : subtype
-
executor >  local (1)
[6b/7f48ed] process > A_B_C [100%] 1 of 1 ✔
[ac/399ae9] process > C     [100%] 1 of 1 ✔
[4a/e8822e] process > A_B   [100%] 1 of 1 ✔
[3e/eec27b] process > A     [100%] 1 of 1 ✔
[6f/3e0a36] process > B     [100%] 1 of 1 ✔
```

## Network Visualization

Check out <https://github.com/montilab/netviz> to explore your networks.