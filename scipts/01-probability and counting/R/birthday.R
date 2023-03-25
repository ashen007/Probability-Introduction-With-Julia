library(gmp)

fact <- function (k) {
  if (k <= 365) {
    fac <- 1

    for (i in (366 - k):365) {
      fac <- fac * i
    }

    return(fac)

  }
}

no_match <- function (k) {
  fact(k) / (365^k)
}

matching_bd <- function (k) {
  1 - no_match(k)
}

ks <- 1: 150
ps <- NULL

for (i in ks) {
  p <- matching_bd(i)
  ps <- c(ps, p)
}

png("../../images/01/birthday.png")
plot(ks, ps)
dev.off()