#' Spatial Data from Integrated Public Safety Circumscriptions (CISP)
#'
#' This is the spatial data from the Integrated Public Safety Circumscriptions (CISP) of the State of Rio de Janeiro.
#'
#'
#' @format ## `spatial_cisp`
#' A spatial data frame
#' \describe{
#'   \item{dp}{id number}
#'   \item{aisp}{Integrated Public Safety Areas (AISP) code}
#'   \item{geometry}{Spatial vector data of CISP}
#' }
#' @source <https://www.ispdados.rj.gov.br/Arquivos/CISPshp.rar>
# "spatial_cisp"
delayedAssign("spatial_cisp", local({
  try(
    sf::read_sf(
      system.file("inst/extdata/spatial_cisp.gpkg", package = "ispdata")
    ),
    silent = TRUE
  )
}))
