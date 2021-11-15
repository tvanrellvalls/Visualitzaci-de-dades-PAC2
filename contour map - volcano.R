library(ggplot2)

filled.contour(volcano, plot.axes = {
  axis(1)
  axis(2)
  contour(volcano, add = TRUE, lwd = 2)
}
)

# Referència:
# https://r-charts.com/es/correlacion/contour/
