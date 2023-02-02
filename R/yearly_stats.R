#' Access the public security statistics of the State of Rio de Janeiro by year
#'
#' Returns yearly data on police occurrences in the State of Rio de Janeiro in the form of a dataframe.
#'
#' Values per 100,000 inhabitants.
#'
#' To see the dictionary of variables, use the function yearly_stats_dictionary().
#'
#' @importFrom utils download.file unzip
#'
#' @param by selects the spatial division of the data. It might be: "municipality" or "state". character.
#'
#' @return a dataframe
#'
#' @examples
#' yearly_stats(by = "state")
#'
#' @export
yearly_stats <- function(by) {

  hom_doloso <- ameaca <- NULL

  if(by == 'state') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/DOMensalEstadoDesde1991TAXA.csv'
  }

  if(by == 'municipality') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/BaseMunicipioTaxaAno.csv'
  }

  df <-  readr::read_csv2(link, locale = readr::locale(encoding = "latin1"), show_col_types = FALSE) |>
    janitor::clean_names()

  if(by == 'municipality') {
    suppressWarnings({
      df <- df |>
        dplyr::mutate(dplyr::across(c(hom_doloso:ameaca),
                                    ~ readr::parse_number(., locale = readr::locale(decimal_mark = ","))))
    })
  }

  message('Query completed.')
  return(df)
}
