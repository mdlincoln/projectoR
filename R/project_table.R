#' Project a bimodal edge list into a unimodal edge list
#'
#' This function takes a table with an edge list, where the first two columns
#' describe the source and target vertices/nodes of multiple edges. It will
#' return an edge list of a projected network with the \code{joining_col}
#' vertices removed.
#'
#' @param df A data.frame with the oribinal bimodal edge list
#' @param joining_col The quoted name of the column with the node ids that will
#'   be removed from the projected graph
#'
#' @return A data.frame edgelist with the columns \code{from} and \code{to} each
#'   containing IDs from \code{joining_col}, along with a \code{weight} column.
#'
#' @export
#' @examples
#' bipartite_list <- data.frame(
#'   club = c("Karate", "Karate", "Book", "Chess", "Book", "Chess"),
#'   student = c(1, 2, 1, 3, 2, 4),
#'   stringsAsFactors = FALSE)
#'
#' project_table(bipartite_list, joining_col = "club")
#' #>   from to weight
#' #> 1    1  2      2
#' #> 2    3  4      1
project_table <- function(df, joining_col) {

  # Create a bipartite graph
  bg <- igraph::graph.data.frame(df, directed = FALSE)

  # Set the vertex types by checking if a given vertex name in the bipartite
  # graph is in the list of vertex names in joining_col. Type TRUE means it is a
  # vertex that we want to project OUT of the graph; type FALSE means its a
  # vertex we want to keep in the resulting projection.
  igraph::V(bg)$type <- igraph::V(bg)$name %in% df[[joining_col]]

  # Project into a unipartite graph. Given the way that we encoded the vertex
  # types above, we want the FALSE bipartite projection
  ug <- igraph::bipartite.projection(bg, which = FALSE)

  # Return the new edge list
  igraph::get.data.frame(ug, what = "edges")
}
