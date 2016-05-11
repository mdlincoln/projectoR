#' Project a bimodal edge list into a unimodal edge list
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
  bg <- igraph::graph_from_data_frame(df, directed = FALSE)

  # Set the vertex types
  igraph::V(bg)$type <- igraph::V(bg)$name %in% df[[joining_col]]

  # Project into a unipartite graph
  ug <- igraph::bipartite_projection(bg, which = FALSE)

  # Return the new edge list
  igraph::as_data_frame(ug, what = "edges")
}
