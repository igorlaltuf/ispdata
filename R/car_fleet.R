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
#' \dontrun{car_fleet(by = "month")}
#'
#' @export
car_fleet <- function(by) {

  options(scipen = 999, timeout = 1500)

  if(by == 'month') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/FrotaVeiculoEstadoMES.csv'
  }

  if(by == 'year') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/FrotaVeiculoEstadoANO.csv'
  }

  suppressWarnings({

    tryCatch({
      df <-  readr::read_csv2(link, locale = readr::locale(encoding = "latin1"),
                              show_col_types = FALSE) |>
        janitor::clean_names()
      message("Query completed.")

    },
    # show error message

    error = function(e) {
      message("Error downloading file. Try again later.") }
    )

  })

  old <- options(timeout = 60)
  on.exit(options(old))

  return(df)
}
