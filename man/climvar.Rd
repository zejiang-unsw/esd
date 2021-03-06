% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/climvar.R
\name{climvar}
\alias{climvar}
\title{Seasonally varying variance}
\usage{
climvar(x, FUN = "sd", plot = TRUE, ...)
}
\arguments{
\item{x}{an input object of class 'station'}

\item{FUN}{a function}

\item{plot}{a boolean; if TRUE show plot}

\item{\dots}{additional arguments}

\item{verbose}{a boolean; if TRUE print information about progress}
}
\description{
\code{climvar} estimates how the variance varies with season
in terms of the inter-annual variability of daily standard deviation
}
