#' Access data from gun seizure in State of Rio de Janeiro
#'
#' Returns monthly data about gun seizure in State of Rio de Janeiro in the form of a dataframe.
#'
#' @importFrom utils download.file unzip
#'
#' @param gun_type selects the gun type: "firearms" or "edged_weapons". character.
#'
#' @return a dataframe
#'
#' @examples
#' \donttest{gun_seizure(gun_type = "firearms")}
#'
#' @export
gun_seizure <- function(gun_type) {

  if(gun_type == 'firearms') {
    gun_option <- 1
  }

  if(gun_type == 'edged_weapons') {
    gun_option <- 2
  }

  link <- 'https://www.ispdados.rj.gov.br/Arquivos/ArmasApreendidasEvolucaoCisp.xlsx'

  df <- openxlsx::readWorkbook(link, startRow = 1,sheet = gun_option) |>
    janitor::clean_names()

  message('Query completed.')
  return(df)

}
