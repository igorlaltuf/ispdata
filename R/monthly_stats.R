#' Access the public security statistics of the State of Rio de Janeiro by month
#'
#' Returns monthly data on police occurrences in the State of Rio de Janeiro in the form of a dataframe.
#'
#' To see the dictionary of variables, use the function monthly_stats_dictionary().
#'
#' @importFrom utils download.file unzip
#'
#' @param by selects the spatial division of the data. It might be: "cisp", "municipality" or "state". character.
#'
#' @param value allows you to choose whether the values will be in absolute numbers ("standard") or per 100,000 inhabitants ("per_100k"). character.
#'
#' @return a dataframe
#'
#' @examples
#' \donttest{monthly_stats(by = "cisp")}
#'
#' @export
monthly_stats <- function(by, value = 'standard') {

  options(scipen = 999, timeout = 1500)

  hom_doloso <- cmba <- NULL

  if(by == 'cisp' & value == 'standard') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/BaseDPEvolucaoMensalCisp.csv'
  }

  if(by == 'cisp' & value == 'per_100k') {
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






  suppressWarnings({

    tryCatch({
      df <-  readr::read_csv2(link, locale = readr::locale(encoding = "latin1"),
                              show_col_types = FALSE) |>
        janitor::clean_names()


      if(by == 'municipality' & value == 'per_100k') {
        suppressWarnings({
          df <- df |>
            dplyr::mutate(dplyr::across(c(hom_doloso:cmba),
                                        ~ readr::parse_number(., locale = readr::locale(decimal_mark = ","))))
        })
      }

      message('Query completed.')

    },
    # em caso de erro, interrompe a função e mostra msg de erro

    error = function(e) {
      message("Error downloading file. Try again later.") }
    )

  })


  old <- options(timeout = 60)
  on.exit(options(old))

  return(df)

}
