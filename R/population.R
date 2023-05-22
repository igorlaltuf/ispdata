#' Access population data
#'
#' Returns data about population by state, municipality, CISP (the same as police station area) or Pacifying Police Unit.
#'
#'
#' @importFrom utils download.file unzip
#'
#' @param data selects the data: "cisp_monthly", "cisp_yearly", "muni_monthly", "muni_yearly", "state_monthly", "state_yearly", "upp_2010" or "upp_projection". character.
#'
#' @return a dataframe.
#'
#' @examples
#' \dontrun{population(data = "cisp_monthly")}
#'
#' @export
population <- function(data) {

  options(scipen = 999, timeout = 1500)

  pop_2010 <- pop_38_upps <- pop_circ <- pop_munic <- x38_upp <- NULL

  if(data == 'cisp_monthly') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/PopulacaoEvolucaoMensalCisp.csv'
  }

  if(data == 'cisp_yearly') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/PopulacaoEvolucaoAnualCisp.csv'
  }

  if(data == 'muni_monthly') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/PopulacaoEvolucaoMensalMunic.csv'
  }

  if(data == 'muni_yearly') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/PopulacaoEvolucaoAnualMunic.csv'
  }

  if(data == 'state_monthly') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/PopulacaoEvolucaoMensalEstado.csv'
  }

  if(data == 'state_yearly') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/PopulacaoEvolucaoAnualEstado.csv'
  }

  if(data == 'upp_2010') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/PopulacaoResidenteUpp2010.xlsx'
  }

  if(data == 'upp_projection') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/PopulacaoProjecaoUpp.xlsx'
  }


  if(data %in% c('cisp_monthly', 'cisp_yearly', 'muni_monthly', 'muni_yearly', 'state_monthly', 'state_yearly')) {

     suppressWarnings({

      tryCatch({

        df <- readr::read_csv2(link, show_col_types = FALSE, locale = readr::locale(encoding = "latin1")) |>
          janitor::clean_names()

        if(data == 'cisp_monthly') {
          df <- df |>
            dplyr::mutate(pop_circ = round(pop_circ, 0))
        }

        if(data == 'muni_yearly') {
          df <- df |>
            dplyr::mutate(pop_munic = round(pop_munic, 0))
        }
        message("Query completed.")

      },
      # em caso de erro, interrompe a função e mostra msg de erro

      error = function(e) {
        message("Error downloading file. Try again later.") }
      )

    })

    return(df)
    stop()
  }

  suppressWarnings({

    tryCatch({
      if(data == 'upp_2010'){
        df <- openxlsx::readWorkbook(link, startRow = 1) |>
          janitor::clean_names() |>
          dplyr::mutate(pop_2010 = round(pop_2010, 0))

        message("Query completed.")
      }
      },
    # em caso de erro, interrompe a função e mostra msg de erro

    error = function(e) {
      message("Error downloading file. Try again later.") }
    )

  })


  suppressWarnings({

    tryCatch({

      if(data == 'upp_projection'){
        df <- openxlsx::readWorkbook(link, startRow = 1, sheet = 2) |>
          janitor::clean_names() |>
          dplyr::rename(pop_38_upps = x38_upp) |>
          dplyr::mutate(pop_38_upps = round(pop_38_upps, 0))

        message("Query completed.")
      }
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
