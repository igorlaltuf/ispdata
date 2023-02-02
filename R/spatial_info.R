#' Access the information about spatial data
#'
#' Returns data about the spatial data in the package. If the data argument is "code_equivalence",
#' it will show the equivalence between AISP, CISP and RISP codes, neighborhoods and cities. If the
#' data argument is "area_km2", it returns a dataframe with the areas of AISP, CISP and RISP by square kilometers.
#'
#'
#' @importFrom utils download.file unzip
#'
#' @param data it may be "code_equivalence" or "area_km2"
#'
#' @return a dataframe
#'
#' @examples
#' spatial_info(data = "code_equivalence")
#'
#' @export
spatial_info <- function(data) {

  if(data == "code_equivalence") {
    link <- "https://www.ispdados.rj.gov.br/Arquivos/Relacao_RISPxAISPxCISP.csv"
  }

  if(data == "area_km2") {
    link <- "https://www.ispdados.rj.gov.br/Arquivos/AreasemKm.csv"
  }

  df <-  readr::read_csv2(link, locale = readr::locale(encoding = "latin1"), show_col_types = FALSE) |>
    janitor::clean_names()

  message('Query completed.')
  return(df)

}
