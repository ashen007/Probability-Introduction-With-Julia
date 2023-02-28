n <- 100

matching <- function(n) {
  r <- replicate(10^4, sum(sample(n) == (1:n)))
  p <- sum(r >= 1) / 10^4

  p
}

matching(n)