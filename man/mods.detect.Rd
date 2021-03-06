% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/constraints.R
\name{mods.detect}
\alias{mods.detect}
\title{Wrapper for weighted gene co-expression analysis}
\usage{
mods.detect(
  eset,
  min.size = 10,
  min.sft = 0.85,
  beta = NULL,
  cores = 1,
  cor.fn = c("bicor", "cor"),
  powers = c(seq(1, 10, by = 1), seq(12, 20, by = 2)),
  merging = FALSE,
  merging.cut = 0.2,
  hclust.method = "average",
  do.plot = TRUE
)
}
\arguments{
\item{eset}{An expression set object}

\item{min.size}{Minimum module size}

\item{min.sft}{Minimum acceptable scale-free fit when choosing soft threshold}

\item{beta}{Override soft thresholding choice}

\item{cores}{Number of cpus to use}

\item{cor.fn}{Method for calculation co-expression similarity}

\item{powers}{A vector of values to test for soft thresholding}

\item{merging}{Merge similar modules by eigengene}

\item{merging.cut}{Maximum dissimilarity that qualifies modules for merging}

\item{hclust.method}{Clustering method passed to hclust}

\item{do.plot}{Use true to see plots}
}
\value{
A list of data pertaining to resulting co-expression modules
}
\description{
Wrapper for weighted gene co-expression analysis
}
