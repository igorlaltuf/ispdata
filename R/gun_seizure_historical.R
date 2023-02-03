#' Access historical data from seizure of firearms in State of Rio de Janeiro
#'
#' Returns monthly historical data about seizure of firearms in State of Rio de Janeiro in the form of a dataframe.
#'
#' Data availability from 2000 to 2006 for the State and from 2003 to 2006 for the Police Station Area.
#'
#' @importFrom utils download.file unzip
#'
#' @param by selects the spatial division of the data: "police_station_area" or "state". character.
#'
#' @return a dataframe
#'
#' @examples
#' gun_seizure_historical(by = "police_station_area")
#'
#' @export
gun_seizure_historical <- function(by) {

  if(by == 'police_station_area') {
   link <- "https://www.ispdados.rj.gov.br/Arquivos/ArmasDP2003_2006.csv"
  }

  if(by == 'state') {
   link <- "https://www.ispdados.rj.gov.br/Arquivos/ArmasEstado2000_2006.csv"
  }

  df <-  readr::read_csv2(link, locale = readr::locale(encoding = "latin1"), show_col_types = FALSE) |>
    janitor::clean_names()

  message('Query completed.')
  return(df)

}
