renv::restore()

data <- read.csv(here::here(
  "data-raw/Data inventory for BOEM - main.csv"
)) |>
  janitor::clean_names() |>
  dplyr::filter(include == TRUE) |>
  dplyr::select(
    -c(
      "database",
      "data_categories_old",
      "duplicate",
      "include_old",
      "reviewed",
      "x",
      "include",
      "notes"
    )
  )

# clean data values
gom_data <- data |>
  dplyr::mutate(
    sourced_from = dplyr::case_when(
      sourced_from == "" ~ "this project",
      sourced_from == "FishFlow" ~ "this project",
      sourced_from == "FishForwrd_new" ~ "FishForwrd_2025-04-24",
      sourced_from == "RWSC_new" ~ "RWSC_2025-04-24",
      sourced_from == "FishForwrd" ~ "FishForwrd_early-2025",
      sourced_from == "RWSC" ~ "RWSC_early-2025"
    ),
    data_availability = dplyr::case_when(
      data_availability == "\"Yes\"" ~ "Yes",
      TRUE ~ data_availability
    ),
    pi_name = dplyr::case_when(
      pi_name == "" ~ "Unknown",
      pi_name == "Multiple" ~ "Unknown",
      TRUE ~ pi_name
    ),
    pi_contact_info = dplyr::case_when(
      pi_contact_info == "" ~ "Unknown",
      pi_contact_info == "Multiple" ~ "Unknown",
      pi_contact_info == "Unkonwn" ~ "Unknown",
      TRUE ~ pi_contact_info
    ),
    spatial_scale = dplyr::case_when(
      spatial_scale == "North Atlantic" ~ "Northwest Atlantic",
      spatial_scale == "NW Atlantic" ~ "Northwest Atlantic",
      TRUE ~ spatial_scale
    ),
    project_description = gsub("[^a-zA-Z0-9[:punct:] ]", "", project_description)
  )


# create R package
# usethis::create_package(
#   here::here(),
#   fields = list(
#     "Package" = "gomData",
#     "Title" = "Gulf of Maine Data Inventory",
#     "Description" = "An inventory of environmental and biological data in the Gulf of Maine, including sources and availability.",
#     "Version" = "0.1.0",
#     "Authors@R" = utils::person(
#       "Abigail",
#       "Tyrell",
#       email = "abigail.tyrell@noaa.gov",
#       role = c("aut", "cre"),
#       comment = c(ORCID = "0000-0002-6656-8470")
#     ),
#     "License" = "MIT",
#     "Encoding" = "UTF-8",
#     "LazyData" = TRUE,
#     "RoxygenNote" = "7.1.2"
#   ),
#   check_name = FALSE
# )

# add data
usethis::use_data(gom_data, overwrite = TRUE)
write.csv(gom_data, here::here("data-raw/gom_data_inventory.csv"))

sinew::makeOxygen(gom_data)
