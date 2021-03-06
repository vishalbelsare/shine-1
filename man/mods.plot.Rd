% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/constraints.R
\name{mods.plot}
\alias{mods.plot}
\title{Plot membership of all genes for all modules}
\usage{
mods.plot(
  dat,
  mods,
  colors,
  size = 1,
  ncol = round(sqrt(length(mods))),
  legend = FALSE,
  fn = bicor
)
}
\arguments{
\item{dat}{Expression data}

\item{mods}{A list of modules}

\item{colors}{Gene colors}

\item{size}{Size of data points}

\item{ncol}{Number of facet columns}

\item{legend}{Use true to include legend}

\item{fn}{A correlation function}
}
\value{
A ggplot object

A ggplot object
}
\description{
Plot membership of all genes for all modules
}
