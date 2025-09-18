for (j in c(
  "Acoustic",
  "Diadromous fish",
  "Bathymetry",
  "Chemical oceanography",
  "Coastal fish",
  "Elasmobranchs",
  "Groundfish",
  "Habitat",
  "Marine mammals",
  "Molluscs",
  "Pelagic fish",
  "Physical oceanography",
  "Plankton",
  "Sea turtles",
  "Seabirds"
)) {
  this_dat <- gom_data |>
    dplyr::filter(stringr::str_detect(data_categories, j))

  if (nrow(this_dat) > 0) {
    res <- knitr::knit_expand(
      text = readLines(here::here("data-raw/category-doc.Rmd")),
      j = j
    )
    sink(here::here(
      "data-raw/bookdown",
      paste0(
        j |>
          stringr::str_replace_all(" ", "-") |>
          stringr::str_replace_all("/", "-"),
        ".Rmd"
      )
    ))
    cat(res, sep = "\n\n")
    sink()
  }
}


bookdown::render_book(
  input = here::here("data-raw/bookdown"),
  output_dir = here::here("docs")
)
