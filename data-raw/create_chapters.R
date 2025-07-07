for (j in c("Acoustic", "Bathymetry", "Chemical oceanography", "Crustaceans", "Forage fish", "Groundfish", "Habitat", "Highly migratory fish", "Marine mammals", "Molluscs", "Physical oceanography", "Plankton", "Protected fish", "Sea turtles", "Seabirds")) {
  this_dat <- gom_data |>
    dplyr::filter(stringr::str_detect(data_categories, j))

  if (nrow(this_dat) > 0) {
    res <- knitr::knit_expand(
      text = readLines(here::here("data-raw/category-doc.Rmd")),
      j = j
    )
    sink(here::here("data-raw/bookdown", paste0(stringr::str_replace_all(j, " ", "-"), ".Rmd")))
    cat(res, sep = "\n\n")
    sink()
  }
}


bookdown::render_book(input = here::here("data-raw/bookdown"),
                      output_dir = here::here("docs"))
