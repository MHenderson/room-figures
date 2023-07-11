# Created by use_targets().
# Follow the comments below to fill in this target script.
# Then follow the manual to check and run the pipeline:
#   https://books.ropensci.org/targets/walkthrough.html#inspect-the-pipeline # nolint

# Load packages required to define the pipeline:
library(targets)
# library(tarchetypes) # Load other packages as needed. # nolint

# Set target options:
tar_option_set(
  packages = c("ggplot2", "patchwork", "tibble"), # packages that your targets need to run
  format = "rds" # default storage format
  # Set other options as needed.
)

# tar_make_clustermq() configuration (okay to leave alone):
options(clustermq.scheduler = "multicore")

# tar_make_future() configuration (okay to leave alone):
# Install packages {{future}}, {{future.callr}}, and {{future.batchtools}} to allow use_targets() to configure tar_make_future() options.

# Run the R scripts in the R/ folder with your custom functions:
tar_source()
# source("other_functions.R") # Source other scripts as needed. # nolint

# Replace the target list below with your own:
list(
  tar_target(
    name = complete_graph_fig,
    command = complete_graph_plot()
  ),
  tar_target(
    name = two_one_factors_fig,
    command = two_one_factors_plot()
  ),
  tar_target(
    name = one_factorisation_fig,
    command = one_factorisation_plot()
  ),
  tar_target(
    name = orthogonal_one_factorisation_fig,
    command = orthogonal_one_factorisation_plot()
  ),
  tar_target(
    name = complete_graph_fig_file,
    command = ggsave("figure/complete_graph.png",
                       plot = complete_graph_fig,
                      width = 2,
                     height = 1)
  ),
  tar_target(
    name = two_one_factors_fig_file,
    command = ggsave("figure/two_one_factors.png",
                       plot = two_one_factors_fig,
                      width = 2,
                     height = 1)
  ),
  tar_target(
    name = one_factorisation_fig_file,
    command = ggsave("figure/one_factorisation.png",
                       plot = one_factorisation_fig,
                      width = 4,
                     height = 2)
  ),
  tar_target(
    name = orthogonal_one_factorisation_fig_file,
    command = ggsave("figure/orthogonal_one_factorisation.png",
                       plot = orthogonal_one_factorisation_fig,
                      width = 8,
                     height = 12)
  )
)
