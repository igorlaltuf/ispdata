#' Access the public security statistics of the State of Rio de Janeiro
#'
#'
#' DESCRIÇÃO DOS DADOS return it in the form of a dataframe.
#'
#'
#' @importFrom utils download.file unzip
#'
#' @param by selects the years which data will be downloaded. character.
#' @param value selects the public agency to be searched. see the available agencies in agencies_initials. character.
#'
#' @return a dataframe ...
#' @examples
#' \dontrun{monthly_stats(by = "")}
#' @export
monthly_stats <- function(by, value = 'standard') {

  if(by == 'police_station_area' & value == 'standard') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/BaseDPEvolucaoMensalCisp.csv'
  }

  if(by == 'police_station_area' & value == 'per_100k') {
    message('The data in this format is not available.\n\nPlease, change the value argument to "standard".\n')
    stop()
  }

  if(by == 'municipality' & value == 'standard') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/BaseMunicipioMensal.csv'
  }

  if(by == 'municipality' & value == 'per_100k') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/BaseMunicipioMensalTaxa.csv'
  }

  if(by == 'state' & value == 'standard') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/DOMensalEstadoDesde1991.csv'
  }

  if(by == 'state' & value == 'per_100k') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/BaseEstadoTaxaMes.csv'
  }

  df <-  readr::read_csv2(link, locale = readr::locale(encoding = "latin1"), show_col_types = FALSE) |>
    janitor::clean_names()

  return(df)

}


df1 <- monthly_stats(by = 'police_station_area')
df2 <- monthly_stats(by = 'police_station_area', value = 'per_100k')
df3 <- monthly_stats(by = 'municipality', value = 'standard')
df4 <- monthly_stats(by = 'municipality', value = 'per_100k')
df5 <- monthly_stats(by = 'state', value = 'standard')
df6 <- monthly_stats(by = 'state', value = 'per_100k')



# Trocar virgula por ponto naqueles dataframes a cada 100 mil hab
# coluna 7 até a 50 para municipality
# coluna 4 até 50 para state


# Função para dicionários xlsx ???
# https://www.ispdados.rj.gov.br/EstSeguranca.html


# funções para criar scripts e teste
# use_r(name = NULL, open = rlang::is_interactive())
# use_test(name = NULL, open = rlang::is_interactive())
