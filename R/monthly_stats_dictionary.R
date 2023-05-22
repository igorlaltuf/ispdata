#' Access the dictionaries of public security statistics of the State of Rio de Janeiro by month
#'
#' Returns the data dictionary of the police occurrences in the State of Rio de Janeiro in the form of a dataframe.
#'
#'
#' @importFrom utils download.file unzip
#'
#' @param by selects the spatial division of the dictionary. It might be: "cisp", "municipality" or "state". character.
#' @param value selects the type of value: absolute numbers ("standard") or per 100,000 inhabitants ("per_100k"). character.
#'
#' @return a dataframe
#'
#' @examples
#' \dontrun{monthly_stats_dictionary(by = "state", value = "per_100k")}
#'
#' @export
monthly_stats_dictionary <- function(by, value = 'standard') {

  options(scipen = 999, timeout = 1500)

  descricao_da_variavel <- NULL

  if(by == 'cisp' & value == 'standard') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/BaseDpDicionarioDeVariaveis.xlsx'
  }

  if(by == 'cisp' & value == 'per_100k') {
    message('The data in this format is not available.\n\nPlease, change the value argument to "standard".\n')
    stop()
  }

  if(by == 'municipality' & value == 'standard') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/BaseMunic%C3%ADpioMensalDicionarioDeVariaveis.xlsx'
  }

  if(by == 'municipality' & value == 'per_100k') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/Dicionariodevari%C3%A1veisBaseMunic%C3%ADpioTaxaMes.xlsx'
  }

  if(by == 'state' & value == 'standard') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/DicionarioVariaveisDOMensalEstadoDesde1991.xlsx'
  }

  if(by == 'state' & value == 'per_100k') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/DicionariodevariaveisBaseEstadoTaxaMes.xlsx'
  }


  suppressWarnings({

    tryCatch({

      df <- openxlsx::readWorkbook(link, startRow = 3) |>
        janitor::clean_names() |>
        dplyr::mutate(descricao_da_variavel = trimws(descricao_da_variavel, "l"),
                      grupo = dplyr::case_when(variavel %in% c("hom_doloso","lesao_corp_morte","latrocinio",
                                                               "cvli","hom_por_interv_policial",
                                                               "letalidade_violenta","tentat_hom",
                                                               "lesao_corp_dolosa","estupro") ~ "crimes violentos",
                                               variavel %in% c("hom_culposo","lesao_corp_culposa") ~ "crimes de transito",
                                               variavel %in% c("roubo_transeunte","roubo_celular","roubo_em_coletivo",
                                                               "roubo_rua","roubo_veiculo","roubo_carga","roubo_comercio",
                                                               "roubo_residencia","roubo_banco","roubo_cx_eletronico",
                                                               "roubo_conducao_saque","roubo_apos_saque","roubo_bicicleta",
                                                               "outros_roubos","total_roubos") ~ "roubos",
                                               variavel %in% c("furto_veiculos","furto_transeunte","furto_coletivo",
                                                               "furto_celular","furto_bicicleta","outros_furtos",
                                                               "total_furtos") ~ "furtos",
                                               variavel %in% c("sequestro","extorsao","sequestro_relampago",
                                                               "estelionato") ~ "outros crimes contra o patrimonio",
                                               variavel %in% c("apreensao_drogas","posse_drogas","trafico_drogas",
                                                               "apreensao_drogas_sem_autor","recuperacao_veiculos",
                                                               "apf","aaapai","cmp","cmba") ~ "atividade policial",
                                               variavel %in% c("ameaca","pessoas_desaparecidas","encontro_cadaver",
                                                               "encontro_ossada","pol_militares_mortos_serv",
                                                               "pol_civis_mortos_serv") ~ "outros registros",
                                               variavel %in% c("registro_ocorrencias") ~ "registros de ocorrencias"))

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
