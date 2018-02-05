fast_intersect <- function(x, y) {
  if (length(x) > length(y)) {
    intersect(y, x)
  } else {
    intersect(x, y)
  }
}
