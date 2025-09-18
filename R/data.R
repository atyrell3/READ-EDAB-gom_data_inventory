#' @title Gulf of Maine Data Inventory
#' @description An inventory of environmental and biological data in the Gulf of Maine, including sources and availability.
#' @format A data frame with 263 rows and 17 variables:
#' \describe{
#'   \item{\code{project_name}}{character Name of the project}
#'   \item{\code{lead_entity}}{character The institution or organization leading the project}
#'   \item{\code{partner_entities}}{character Partner entities involved in the project (optional)}
#'   \item{\code{project_description}knit}{character Description of the project; usually taken from linked webpage or other source}
#'   \item{\code{data_start_date}}{character The year of the earliest data collection recorded in the project; note that some projects may include legacy data collected before the official project start date}
#'   \item{\code{data_end_date}}{character The year of the most recent data collection recorded in the project; "Present" indicates that the project is ongoing}
#'   \item{\code{project_website}}{character Link to the project website or associated report or other documentation of the project's existence}
#'   \item{\code{link_to_data_if_different}}{character Link to webpage where data can be accessed; only included if the data are available through a website other than the project website (optional)}
#'   \item{\code{link_to_metadata_if_different}}{character Link to webpage or other source containing metadata for the project; only included if the metadata are available through a website other than the project website or the data website (optional)
#'   \item{\code{pi_name}}{character The name of the Principal Investigator (PI) for the project. "Unknown" indicates that the PI could not be identified.}
#'   \item{\code{pi_contact_info}}{character The email address or website link to contact the PI. "Unknown" indicates that contact information could not be found.}
#'   \item{\code{sourced_from}}{character Two project databases were reviewed. "FishForwrd_2025-04-25" indicates that the project was identified in the FishForwrd database on April 25, 2025. "FishForwrd_early-2025" indicates that the project was identified in the FishForwrd database in early 2025, but not in the April data pull. "RWSC_2025-04-25" indicates that the project was identified in the RWSC database on April 25, 2025. "RWSC_early-2025" indicates that the project was identified in the RWSC database in early 2025, but not in the April data pull."this project" indicates that the project was identified as part of the research conducted for this project.}
#'   \item{\code{spatial_scale}}{character The spatial scale of the project. Options are "Global", "USA", Northwest Atlantic", "Gulf of Maine", "State", and "Project".}
#'   \item{\code{data_categories}}{character The categories of data collected in the project. Options are "Acoustic", "Anadramous/Catadromous Fishes", "Bathymetry", "Chemical oceanography", "Coastal fish", "Elasmobranchs", "Groundfish", "Habitat", "Marine mammals", "Molluscs", "Pelagic fish", "Physical oceanography", "Plankton", "Sea turtles", "Seabirds".}
#'   \item{\code{data_availability}}{character Whether the data is publicly available. "Yes" indicates that the data is available for download or access through a website. "No" indicates that the data is not publicly available. "Yes, by request" indicates that the data is not publicly available for download, but the project webpage states that it is available on a case-by-case basis.}
#'   \item{\code{data_type}}{character There are two data categories. "Spatial" describes data that includes spatial information, such as coordinates. "Research project, synthesis, or technology development" describes data that does not include spatial information, but is relevant to the collection and interpretation of environmental and biological data in the Gulf of Maine.}
#'   \item{\code{notes}}{character Any notes about the project or associated data (optional)}
#' }
"gom_data"
