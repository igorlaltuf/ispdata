#' Access data from car fleet
#'
#' Returns data about car fleet in State of Rio de Janeiro in the form of a dataframe.
#'
#' @importFrom utils download.file unzip
#'
#' @param by "month" or "year". character.
#'
#'
#' @return a dataframe.
#'
#' @examples
#' car_fleet(by = "month")
#'
#' @export
car_fleet <- function(by) {

  if(by == 'month') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/FrotaVeiculoEstadoMES.csv'
  }

  if(by == 'year') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/FrotaVeiculoEstadoANO.csv'
  }

  df <- readr::read_csv2(link, locale = readr::locale(encoding = "latin1"), show_col_types = FALSE) |>
    janitor::clean_names()

  message('Query completed.')
  return(df)
}
