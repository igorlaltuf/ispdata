#' Spatial Data from Integrated Public Safety Regions (RISP)
#'
#' This is the spatial data from the Integrated Public Safety Regions (RISP) of the State of Rio de Janeiro.
#'
#'
#' @format ## `spatial_risp`
#' A spatial data frame
#' \describe{
#'   \item{risp}{risp number}
#'   \item{geometry}{Spatial vector data of RISP}
#' }
#' @source <https://www.ispdados.rj.gov.br/Arquivos/RISPshp.rar>
delayedAssign("spatial_risp", local({
  try(
    sf::read_sf(
      system.file("inst/extdata/spatial_risp.gpkg", package = "ispdata")
    ),
    silent = TRUE
  )
}))
