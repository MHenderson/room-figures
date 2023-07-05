complete_graph_plot <- function() {

  g <- igraph::make_full_graph(4)
  h <- igraph::make_full_graph(5)
  
  gp <- ggraph::ggraph(g, layout = 'circle') +
    ggraph::geom_edge_link() +
    ggraph::geom_node_point()
  
  hp <- ggraph::ggraph(h, layout = 'circle') +
    ggraph::geom_edge_link() +
    ggraph::geom_node_point()
  
  gp + hp
  
}