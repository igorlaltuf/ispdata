#' Access the public security statistics about crimes against life in the State of Rio de Janeiro
#'
#' Returns monthly data about crimes against life in the State of Rio de Janeiro in the form of a dataframe.
#'
#' The data available are on femicide, violent lethality, the rate of elucidation of cases of violent lethality or death of police officers on duty.
#'
#'
#' @importFrom utils download.file unzip
#'
#' @param type allows you to select the type of violent crime: "femicide", "violent_lethality", "violent_lethality_elucidation_rate" or "officers_killed_on_duty". character.
#'
#' @return a dataframe
#'
#' @examples
#' \dontrun{crimes_against_life(type = "femicide")}
#'
#' @export
crimes_against_life <- function(type) {

  options(scipen = 999, timeout = 1500)

  taxa_por_100_mil_habitantes <- NULL

  if(type == 'violent_lethality') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/SeriesHistoricas.xlsx'

    suppressWarnings({

      tryCatch({
        df <- openxlsx::readWorkbook(link, startRow = 1) |>
          janitor::clean_names() |>
          dplyr::mutate(taxa_por_100_mil_habitantes = round(taxa_por_100_mil_habitantes, 2))

        message("Query completed.")
        return(df)

      },
      # em caso de erro, interrompe a função e mostra msg de erro

      error = function(e) {
        message("Error downloading file. Try again later.")
        stop() # stop the function
        }
      )
    })

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


  suppressWarnings({

    tryCatch({
      df <- readr::read_csv2(link, locale = readr::locale(encoding = "latin1"), show_col_types = FALSE) |>
        janitor::clean_names()
      message("Query completed.")

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
