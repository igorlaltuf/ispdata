#' Access the statistics about bicycle theft of the State of Rio de Janeiro
#'
#' Returns monthly data on police occurrences involving bicycle theft in the State of Rio de Janeiro in the form of a dataframe.
#'
#' @importFrom utils download.file unzip
#'
#' @return a dataframe
#'
#' @examples
#' \dontrun{bicycle_theft()}
#'
#' @export
bicycle_theft <- function() {

  options(scipen = 999, timeout = 1500)

  link <- 'https://www.ispdados.rj.gov.br/Arquivos/base_bicicleta.csv'

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
