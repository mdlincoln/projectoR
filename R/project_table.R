#' Project a bimodal edge list into a unimodal edge list
#'
#' @param df A data.frame with the oribinal bimodal edge list
#' @param joining_col The quoted name of the column with tth
#'
#' @export
#' @examples
#' bipartite_list <- data.frame(
#'   club = c("Karate", "Karate", "Book", "Chess", "Book", "Chess"),
#'   student = c(1, 2, 1, 3, 2, 4),
#'   stringsAsFactors = FALSE)
#'
#' project_table(bipartite_list, joining_col = "club", projected_col = "student")
#' #>   from to weight
#' #> 1    1  2      2
#' #> 2    3  4      1
project_table <- function(df, joining_col, projected_col) {

  # Create a bipartite graph
  bg <- igraph::graph_from_data_frame(df, directed = FALSE)

  # Set the vertex types
  igraph::V(bg)$type <- igraph::V(bg)$name %in% df[[projected_col]]

  # Project into a unipartite graph
  ug <- igraph::bipartite_projection(bg, which = TRUE)

  # Return the new edge list
  igraph::as_data_frame(ug, what = "edges")
}
