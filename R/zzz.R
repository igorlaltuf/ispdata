.onLoad <- function(lib, pkg) {
  # Make sure the dbplyr methods are loaded
  loadNamespace("sf")
  # Work around bug in code checking in R 4.2.2 for use of packages
  dummy <- function() sf::st_as_sf()
}
