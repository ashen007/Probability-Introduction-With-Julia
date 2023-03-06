library(dslabs)
library(ggplot2)
library(gridExtra)

experiment <- function(n, p) {
  ps <- NULL

  for (i in 0:n) {
    ps <- c(ps, dbinom(i, n, p))
  }

  return(ps)

}

build_plots <- function() {
  ns <- c(10, 100)
  ps <- c(0.1, 0.25, 0.65, 0.95)
  gs <- list()

  for (j in seq_along(ns)) {

    for (i in seq_along(ps)) {
      ys <- experiment(ns[j], ps[i])
      xs <- 0:ns[j]
      df <- data.frame(xs, ys)

      g <- ggplot(df, aes(.data[["xs"]], .data[["ys"]])) +
        geom_point() +
        labs(title = sprintf("Bin(%d, %.2f)", ns[j], ps[i]))

      gs[[i + (4 * (j - 1))]] <- g

    }

  }

  return(gs)

}

plots <- build_plots()
gridExtra::grid.arrange(grobs = plots)