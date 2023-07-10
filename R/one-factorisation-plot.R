one_factorisation_plot <- function() {

  g <- igraph::make_full_graph(6)
  
  gt <- tidygraph::as_tbl_graph(g)
  
  gtc <- gt |>
    tidygraph::activate(edges) |>
    dplyr::mutate(
      f = c(1, 4, 2, 5, 3, 2, 5, 3, 4, 3, 1, 5, 4, 1, 2)
    )
  
  ggraph::ggraph(gtc, layout = 'circle') +
    ggraph::geom_edge_link(
           mapping = ggplot2::aes(edge_colour = f),
       show.legend = FALSE,
        angle_calc = 'along'
    ) +
    ggraph::geom_node_point() +
    ggraph::facet_edges(~f, nrow = 2) +
    #ggraph::theme_graph() +
    ggplot2::theme_void() +
    ggplot2::theme(
      strip.background = ggplot2::element_blank(),
          strip.text.x = ggplot2::element_blank()
    )
  
}