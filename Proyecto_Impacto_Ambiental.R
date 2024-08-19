library(sf)
library(ggplot2)
library(tmap)


# Cargar datos
uso_suelo <- st_read("D:/NIXON/MI MUNDO PROPIO/08 SIG/R CON GEE/Libreria SF/Proyecto/Uso o vocacion del suelo.shp")
areas_protegidas <- st_read("D:/NIXON/MI MUNDO PROPIO/08 SIG/R CON GEE/Libreria SF/Proyecto/Area protegida.shp")
