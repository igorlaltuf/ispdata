#' Access data from Pacifying Police Units (UPPs)
#'
#' Returns data about Pacifying Police Units in the form of a dataframe.
#'
#'
#' @importFrom utils download.file unzip
#'
#' @param data selects the data: "stats", "dates", "population" or "area_m2". character.
#'
#'
#' @return a dataframe or a sf object.
#'
#' @examples
#' upp_data(data = "stats")
#'
#' @export
upp_data <- function(data) {

  data_ocupacao <- data_instalacao <- data_extincao <- pop_2010 <- NULL

  if(data == 'stats') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/UppEvolucaoMensalDeTitulos.csv'

    df <-  readr::read_csv2(link, locale = readr::locale(encoding = "latin1"), show_col_types = FALSE) |>
      janitor::clean_names()

    message('Query completed.')
    return(df)
    stop()
  }

  if(data == 'dates') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/UppDatasDeOcupacaoeInstalacao.xlsx'
  }

  if(data == 'population') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/PopulacaoResidenteUpp2010.xlsx'
  }

  if(data == 'area_m2') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/AreasUPP.xlsx'
  }

  df <- openxlsx::readWorkbook(link, startRow = 1) |>
    janitor::clean_names()

  if(data == "dates") {
    df <- df |>
      dplyr::mutate(data_ocupacao = as.Date(data_ocupacao, origin = "1899-12-30"),
                    data_instalacao = as.Date(data_instalacao, origin = "1899-12-30"),
                    data_extincao = substr(as.character(as.Date(data_extincao, origin = "1899-12-30")), 0, 7))
  }

  if(data == "population") {
    df <- df |>
      dplyr::mutate(pop_2010 = round(pop_2010 ,0))
  }

  message('Query completed.')
  return(df)
}
