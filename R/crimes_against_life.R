#' Access the public security statistics about crimes against life in the State of Rio de Janeiro
#'
#' Returns yearly data about crimes against life in the State of Rio de Janeiro in the form of a dataframe.
#'
#' The data available are on femicide, death of police officers on duty, violent lethality and the rate of elucidation of cases of violent lethality.
#'
#'
#' @importFrom utils download.file unzip
#'
#' @param type selects the type: "violent_lethality", "violent_lethality_elucidation_rate","officers_killed_on_duty", "femicide". character.
#'
#' @return a dataframe
#'
#' @examples
#' crimes_against_life(type = "femicide")
#'
#' @export
crimes_against_life <- function(type) {

  taxa_por_100_mil_habitantes <- NULL

  if(type == 'violent_lethality') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/SeriesHistoricas.xlsx'

    df <-  openxlsx::readWorkbook(link, startRow = 1) |>
      janitor::clean_names() |>
      dplyr::mutate(taxa_por_100_mil_habitantes = round(taxa_por_100_mil_habitantes, 2))

    message('Query completed.')
    return(df)
    stop()
  }

  if(type == 'violent_lethality_elucidation_rate') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/base_elucidacao.csv'
  }

  if(type == 'officers_killed_on_duty') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/PoliciaisMortos.csv'
  }

  if(type == 'femicide') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/BaseFeminicidioEvolucaoMensalCisp.csv'
  }

  df <- readr::read_csv2(link, locale = readr::locale(encoding = "latin1"), show_col_types = FALSE) |>
    janitor::clean_names()

  message('Query completed.')
  return(df)
}
