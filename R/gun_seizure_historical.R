#' Access historical data from seizure of firearms in State of Rio de Janeiro
#'
#' Returns historical data about seizure of firearms in State of Rio de Janeiro in the form of a dataframe.
#'
#' Data availability:
#' total for the state from 2000 to 2006.
#' total for police station area from 2003 to 2006.
#'
#' @importFrom utils download.file unzip
#'
#' @param by selects the gun type: "firearms" or "edged_weapons". character.
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
