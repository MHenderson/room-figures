orthogonal_one_factorisation_plot <- function() {
  
  g <- igraph::make_full_graph(8)
  
  gt <- tidygraph::as_tbl_graph(g)
  
  gtc1 <- gt |>
    tidygraph::activate(edges) |>
    dplyr::mutate(
      f = c(1, 2, 3, 4, 5, 6, 7,
            3, 2, 5, 4, 7, 6,
            1, 6, 7, 4, 5,
            7, 6, 5, 4,
            1, 2, 3,
            3, 2,
            1)
    )
  
  gtc2 <- gt |>
    tidygraph::activate(edges) |>
    dplyr::mutate(
      f = c(4, 6, 3, 5, 7, 1, 2,
            7, 2, 1, 3, 5, 6,
            5, 2, 1, 4, 3,
            7, 4, 6, 1,
            6, 3, 4,
            2, 5,
            7)
    )
  
  p1 <- ggraph::ggraph(gtc1, layout = 'circle') +
    ggraph::geom_edge_link(
      mapping = ggplot2::aes(edge_colour = f),
      show.legend = FALSE,
      edge_width = 2,
    ) +
    ggraph::geom_node_point(size = 4) +
    ggraph::facet_edges(~f) +
    ggplot2::theme_void() +
    ggplot2::theme(
      strip.background = ggplot2::element_blank(),
      strip.text.x = ggplot2::element_blank()
    )
  
  p2 <- ggraph::ggraph(gtc2, layout = 'circle') +
    ggraph::geom_edge_link(
      mapping = ggplot2::aes(edge_colour = f),
      show.legend = FALSE, 
      edge_width = 2,
    ) +
    ggraph::geom_node_point(size = 4) +
    ggraph::facet_edges(~f) +
    ggplot2::theme_void() +
    ggplot2::theme(
      strip.background = ggplot2::element_blank(),
      strip.text.x = ggplot2::element_blank()
    )
  
  p1 / p2

}