#' Access historical data from seizure of firearms in State of Rio de Janeiro
#'
#' Returns monthly historical data about seizure of firearms in State of Rio de Janeiro in the form of a dataframe.
#'
#' Data availability from 2000 to 2006 for the State and from 2003 to 2006 for the Police Station Area (also called CISP).
#'
#' @importFrom utils download.file unzip
#'
#' @param by selects the spatial division of the data: "cisp" or "state". character.
#'
#' @return a dataframe
#'
#' @examples
#' \dontrun{gun_seizure_historical(by = "cisp")}
#'
#' @export
gun_seizure_historical <- function(by) {
  options(scipen = 999, timeout = 1500)

  if(by == 'cisp') {
   link <- "https://www.ispdados.rj.gov.br/Arquivos/ArmasDP2003_2006.csv"
  }

  if(by == 'state') {
   link <- "https://www.ispdados.rj.gov.br/Arquivos/ArmasEstado2000_2006.csv"
  }



  suppressWarnings({

    tryCatch({
      df <-  readr::read_csv2(link, locale = readr::locale(encoding = "latin1"),
                              show_col_types = FALSE) |>
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
