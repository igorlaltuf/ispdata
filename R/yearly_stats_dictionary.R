#' Access the dictionaries of public security statistics of the State of Rio de Janeiro by year
#'
#' Returns the data dictionary of the police occurrences in the State of Rio de Janeiro in the form of a dataframe.
#'
#'
#' @importFrom utils download.file unzip
#'
#' @param by selects the spatial division of the dictionary. It might be: "municipality" or "state". character.
#'
#' @return a dataframe
#'
#' @examples
#' yearly_stats_dictionary(by = "state")
#'
#' @export
yearly_stats_dictionary <- function(by) {

  descricao_da_variavel <- NULL

  if(by == 'municipality') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/DicionarioVariaveisBaseMunicipioTaxaAno.xlsx'
  }

  if(by == 'state') {
    link <- 'https://www.ispdados.rj.gov.br/Arquivos/DicionarioVariaveisTAXADOMensalEstadoDesde1991.xlsx'
  }

  df <-  openxlsx::readWorkbook(link,startRow = 3) |>
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
  return(df)

}
