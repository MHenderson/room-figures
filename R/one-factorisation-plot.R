one_factorisation_plot <- function() {

  g <- igraph::make_full_graph(6)
  
  gt <- tidygraph::as_tbl_graph(g)
  
  gtc <- gt %>%
    tidygraph::activate(edges) %>%
    dplyr::mutate(
      f = c(1, 4, 2, 5, 3, 2, 5, 3, 4, 3, 1, 5, 4, 1, 2)
    )
  
  ggraph::ggraph(gtc, layout = 'circle') +
    ggraph::geom_edge_link(
           mapping = ggplot2::aes(edge_colour = f),
       show.legend = FALSE,
        angle_calc = 'along',
        edge_width = 1.5,
        label_size = 6
    ) +
    ggraph::geom_node_point(
         size = 4
    ) +
    ggraph::facet_edges(~f)# +
    #ggraph::theme_graph()
  
} 