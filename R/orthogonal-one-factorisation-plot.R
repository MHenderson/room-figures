orthogonal_one_factorisation_plot <- function() {
  
  g <- igraph::make_full_graph(8)
  
  gt <- tidygraph::as_tbl_graph(g)
  
  gtc1 <- gt %>%
    tidygraph::activate(edges) %>%
    dplyr::mutate(
      f = c(1, 2, 3, 4, 5, 6, 7,
            3, 2, 5, 4, 7, 6,
            1, 6, 7, 4, 5,
            7, 6, 5, 4,
            1, 2, 3,
            3, 2,
            1)
    )
  
  gtc2 <- gt %>%
    tidygraph::activate(edges) %>%
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
    ggraph::geom_node_point(size = 4) +
    ggraph::geom_edge_link(
      mapping = ggplot2::aes(label = f, edge_colour = f),
      show.legend = FALSE,
      angle_calc = 'along',
      label_dodge = ggplot2::unit(3.5, 'mm'),
      label_push = ggplot2::unit(-6.0, 'mm'),
      start_cap = ggraph::circle(4, 'mm'),
      end_cap = ggraph::circle(4, 'mm'),
      label_colour = "blue", 
      edge_width = 2,
      label_size = 6
    ) +
    ggraph::facet_edges(~f)
  
  p2 <- ggraph::ggraph(gtc2, layout = 'circle') +
    ggraph::geom_node_point(size = 4) +
    ggraph::geom_edge_link(
      mapping = ggplot2::aes(label = f, edge_colour = f),
      show.legend = FALSE,
      angle_calc = 'along',
      label_dodge = ggplot2::unit(3.5, 'mm'),
      label_push = ggplot2::unit(-6.0, 'mm'),
      start_cap = ggraph::circle(4, 'mm'),
      end_cap = ggraph::circle(4, 'mm'),
      label_colour = "blue", 
      edge_width = 2,
      label_size = 6
    ) +
    ggraph::facet_edges(~f)
  
  p1 / p2 

}