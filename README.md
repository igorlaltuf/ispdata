
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ispdata: o pacote para acessar as estatísticas de Segurança Pública do Estado do Rio de Janeiro

<!-- badges: start -->

[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/ispdata)](https://cran.r-project.org/package=ispdata)
[![CRAN_Download_Badge](http://cranlogs.r-pkg.org/badges/ispdata)](https://CRAN.R-project.org/package=ispdata)
[![CRAN_Download_Badge](http://cranlogs.r-pkg.org/badges/grand-total/ispdata)](https://CRAN.R-project.org/package=ispdata)
[![“Buy Me A
Coffee”](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/igorlaltuf)
<!-- badges: end -->

## Sobre o pacote

O pacote ispdata permite acessar os dados do Instituto de Segurança
Pública (ISP) do Rio de Janeiro por meio do R.

## Instalação

Para instalar via [CRAN](https://CRAN.R-project.org/package=ispdata):

``` r
install.packages("ispdata")
library(ispdata)
```

Para instalar a versão em
desenvolvimento[(GitHub)](https://github.com/igorlaltuf/ispdata):

``` r
install.packages("devtools")
devtools::install_github("igorlaltuf/ispdata")
library(ispdata)
```

## Exemplos

Acessar estatísticas de segurança pública por área de delegacia de
polícia:

``` r
df <- monthly_stats(by = 'police_station_area') 
```

Carregar o dicionário de dados da tabela acima:

``` r
data_dictionary <- monthly_stats_dictionary(by = 'police_station_area')
```

Acessar dados sobre feminicídio:

``` r
df <- crimes_against_life(type = "femicide")
```

Ver estatísticas sobre apreensão de armas:

``` r
df <- gun_seizure(gun_type = "firearms")
```

Carregar estatísticas de segurança pública em área de UPPs:

``` r
df <- upp_data(data = "stats")
```

Dados espaciais vetoriais dos limites das UPPs:

``` r
shape <- spatial_upp
```

## Citação

Para citar em trabalhos, use:

``` r
citation('ispdata')
#> 
#> To cite package 'ispdata' in publications use:
#> 
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Misc{,
#>     title = {ISPDATA: the package to access public security data from the State of Rio de Janeiro.},
#>     author = {Igor Laltuf},
#>     year = {2023},
#>     url = {https://github.com/igorlaltuf/ispdata},
#>   }
```
