library(tidyverse)
library(tidyquant)

nikkei <- tq_get("^N225")
nikkei

g1 <- ggplot(nikkei,mapping = aes(x=date,y=adjusted)) +
    geom_line()
g1
tail(nikkei)

data("FANG")

head(FANG)

g2 <- ggplot(FANG, mapping = aes(x=date,y=adjusted,color=symbol)) +
  geom_line() +
  facet_wrap(~symbol,ncol = 2)

g2

library(tseries)
adf.test()

allPackages <- installed.packages()[, 1]
findBrokenPackages <- function(packages) {
  for (p in packages) {
    tryCatch(ncol(asNamespace(p)$.__NAMESPACE__.$S3methods),
             error = function(e) print(c(p, e)))
  }
}
findBrokenPackages(allPackages)