#' Access the statistics about bicycle theft of the State of Rio de Janeiro
#'
#' Returns monthly data on police occurrences involving bicycle theft in the State of Rio de Janeiro in the form of a dataframe.
#'
#' @importFrom utils download.file unzip
#'
#' @return a dataframe
#'
#' @examples
#' bicycle_theft()
#'
#' @export
bicycle_theft <- function() {

  link <- 'https://www.ispdados.rj.gov.br/Arquivos/base_bicicleta.csv'

  df <-  readr::read_csv2(link, locale = readr::locale(encoding = "latin1"), show_col_types = FALSE) |>
    janitor::clean_names()

  message('Query completed.')
  return(df)

}
