library(cartogram)
library(tmap)
library(maptools)

# Conjunt de dades públiques de R
data(wrld_simpl)

# Prenem el continent Africà
afr <- wrld_simpl[wrld_simpl$REGION == 2, ]

# Projectam el mapa
afr <- spTransform(afr, CRS("+init=epsg:3395"))

# Construïm el cartograma segons la població de cada país del 2005
afr_cont <- cartogram_cont(afr, "POP2005", itermax = 5)

# Grafiquem el mapa real d'Àfrica i el distorsionat per la població (en milions)
par(mfcol=c(1,2))
tm_shape(afr) + tm_polygons("POP2005", style = "jenks") +
  tm_layout(frame = FALSE, legend.position = c("left", "bottom"))

tm_shape(afr_cont) + tm_polygons("POP2005", style = "jenks") +
  tm_layout(frame = FALSE, legend.position = c("left", "bottom"))


# Referència:
#https://cran.r-project.org/web/packages/cartogram/readme/README.html
