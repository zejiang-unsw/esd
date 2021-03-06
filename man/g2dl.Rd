% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/g2dl.R
\name{g2dl}
\alias{g2dl}
\alias{g2dl.default}
\alias{g2dl.stationmeta}
\alias{g2dl.field}
\alias{g2dl.eof}
\alias{g2dl.corfield}
\alias{g2dl.events}
\alias{g2dl.trajectory}
\title{Transform longitudes between a system of 0-360E and 180W-180E}
\usage{
g2dl(x, greenwich = TRUE, verbose = FALSE, ...)
}
\arguments{
\item{x}{the input object}

\item{greenwich}{a boolean; if TRUE longitudes are transformed to a system starting at the Greenwich line (0-360E); if FALSE longitudes are transformed to a system starting at the date line (180W-180E)}

\item{verbose}{a boolean; if TRUE print information about progress}

\item{...}{other arguments}

\item{lon}{longitudes}

\item{lat}{latitudes}

\item{d}{dimensions}
}
\value{
an object of the same type as the input
}
\description{
Transform longitudes between a system starting at the Greenwich line (\code{greenwich}=TRUE), going from 0 to 360 degrees, 
and one starting at the date line (\code{greenwich}=FALSE) going from -180 to 180 degrees.
}
\details{
\code{g2dl} is an S3 method and will redirect to a fitting function depending on the input. 
The output of \code{g2dl} is of the same class and format as the input. The attribute 'greenwich' (\code{attr(x,'greenwich')})
holds information about the longitude system of an object.
}
