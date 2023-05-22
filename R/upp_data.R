#' Access data from Pacifying Police Units (UPPs)
#'
#' Returns data about Pacifying Police Units in the form of a dataframe.
#'
#' @importFrom utils download.file unzip
#'
#' @param data selects the data: "stats", "dates" or "area_m2". character.
#'
#'
#' @return a dataframe.
#'
#' @examples
#' \dontrun{upp_data(data = "area_m2")}
#'
#' @export
upp_data <- function(data) {

  options(scipen = 999, timeout = 1500)

  data_ocupacao <- data_instalacao <- data_extincao <- pop_2010 <- NULL

  if(data == 'stats') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/UppEvolucaoMensalDeTitulos.csv'


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

    return(df)
    stop()
  }

  if(data == 'dates') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/UppDatasDeOcupacaoeInstalacao.xlsx'
  }

  if(data == 'area_m2') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/AreasUPP.xlsx'
  }


  suppressWarnings({

    tryCatch({

      df <- openxlsx::readWorkbook(link, startRow = 1) |>
        janitor::clean_names()

      if(data == "dates") {
        df <- df |>
          dplyr::mutate(data_ocupacao = as.Date(data_ocupacao, origin = "1899-12-30"),
                        data_instalacao = as.Date(data_instalacao, origin = "1899-12-30"),
                        data_extincao = substr(as.character(as.Date(data_extincao, origin = "1899-12-30")), 0, 7))

        message('Query completed.')
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
