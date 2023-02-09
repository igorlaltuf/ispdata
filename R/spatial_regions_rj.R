#' Spatial Data from Regions of the State of Rio de Janeiro
#'
#' This is the spatial data from the State of Rio de Janeiro.
#'
#'
#' @format ## `spatial_regions_rj`
#' A spatial data frame
#' \describe{
#'   \item{id1}{id number}
#'   \item{regiao}{region name}
#'   \item{geometry}{Spatial vector data of the regions}
#' }
#' @source <https://www.ispdados.rj.gov.br/Arquivos/RegioesSHP.rar>
delayedAssign("spatial_regions_rj", local({
  try(
    sf::read_sf(
      system.file("inst/extdata/spatial_regions_rj.gpkg", package = "ispdata")
    ),
    silent = TRUE
  )
}))
