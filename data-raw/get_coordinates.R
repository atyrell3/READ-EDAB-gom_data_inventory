## get lat/long of GOM

gom <- NEFSCspatial::epu_sf |>
  dplyr::filter(EPU == "GOM")


crs <- "+proj=longlat +datum=WGS84"

us <- terra::project(
  geodata::gadm(country = "USA", level = 1, resolution = 2, path = "."),
  y = crs
)
canada <- terra::project(
  geodata::gadm(country = "CAN", level = 1, resolution = 2, path = "."),
  y = crs
)

terra::plot(
  us,
  xlim = c(-66, -72),
  ylim = c(41, 45),
  col = "lightgrey",
  border = "black",
  lwd = 0.5,
  main = "Gulf of Maine"
)
terra::plot(canada, col = "lightgrey", border = "black", lwd = 0.5, add = TRUE)

terra::plot(terra::ext(gom), border = "black", lwd = 2, add = TRUE)
