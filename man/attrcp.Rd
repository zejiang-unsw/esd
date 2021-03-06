% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/softattr.R
\name{attrcp}
\alias{attrcp}
\title{Copy attributes}
\usage{
attrcp(x, y, ignore = c("name", "model", "n.apps", "appendix", "dimnames"))
}
\arguments{
\item{x}{input object with attributes}

\item{y}{input object to receive attributes}

\item{ignore}{names of attributes that will not be copied from x to y}
}
\value{
same as y but with attributes of x
}
\description{
Copy the attributes of x to y
}
\seealso{
softattr
}
