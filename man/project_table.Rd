% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/project_table.R
\name{project_table}
\alias{project_table}
\title{Project a bimodal edge list into a unimodal edge list}
\usage{
project_table(df, joining_col)
}
\arguments{
\item{df}{A data.frame with the oribinal bimodal edge list}

\item{joining_col}{The quoted name of the column with the node ids that will
be removed from the projected graph}
}
\value{
A data.frame edgelist with the columns \code{from} and \code{to} each
  containing IDs from \code{joining_col}, along with a \code{weight} column.
}
\description{
This function takes a table with an edge list, where the first two columns
describe the source and target vertices/nodes of multiple edges. It will
return an edge list of a projected network with the \code{joining_col}
vertices removed.
}
\examples{
bipartite_list <- data.frame(
  club = c("Karate", "Karate", "Book", "Chess", "Book", "Chess"),
  student = c(1, 2, 1, 3, 2, 4),
  stringsAsFactors = FALSE)

project_table(bipartite_list, joining_col = "club")
#>   from to weight
#> 1    1  2      2
#> 2    3  4      1
}

