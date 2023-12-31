two_one_factors_plot <- function() {

  g <- tidygraph::tbl_graph(nodes = tibble::tibble(name = c(1, 2, 3, 4)),
                 edges = tibble::tibble(from = c(1, 3), to = c(2, 4)))
  
  h <- tidygraph::tbl_graph(nodes = tibble::tibble(name = c(1, 2, 3, 4)),
                 edges = tibble::tibble(from = c(1, 2), to = c(3, 4)))
  
  gp <- ggraph::ggraph(g, layout = 'circle') +
    ggraph::geom_edge_link() +
    ggraph::geom_node_point() +
    ggraph::geom_node_text(ggplot2::aes(label = name), repel = TRUE, size = 2) +
    ggplot2::theme_void()
  
  hp <- ggraph::ggraph(h, layout = 'circle') +
    ggraph::geom_edge_link() +
    ggraph::geom_node_point() +
    ggraph::geom_node_text(ggplot2::aes(label = name), size = 2, nudge_x = 0.15, nudge_y = 0.2) +
    ggplot2::theme_void()
  
  gp + hp
  
}