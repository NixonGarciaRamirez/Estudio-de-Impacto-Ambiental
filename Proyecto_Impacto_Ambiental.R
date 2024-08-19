library(sf)
library(ggplot2)
library(tmap)


# Cargar datos
uso_suelo <- st_read("D:/NIXON/MI MUNDO PROPIO/08 SIG/R CON GEE/Libreria SF/Proyecto/Uso o vocacion del suelo.shp")
areas_protegidas <- st_read("D:/NIXON/MI MUNDO PROPIO/08 SIG/R CON GEE/Libreria SF/Proyecto/Area protegida.shp")

# Vizualizar datos cargados
plot(uso_suelo)
plot(areas_protegidas)
uso_suelo2 <- st_transform(uso_suelo , crs = 3116)

# Intersección de datos
interseccion <- st_intersection(uso_suelo2, areas_protegidas)



# Visualizar la intersección
plot(st_geometry(uso_suelo2), col = 'lightgreen', main = "Uso del Suelo y Áreas Protegidas")
plot(st_geometry(areas_protegidas), add = TRUE, border = 'red')
plot(st_geometry(interseccion), add = TRUE, col = 'blue')


# Ejemplo de identificación de áreas sensibles
areas_sensibles <- st_difference(uso_suelo2, areas_protegidas)


# vixualizacion de areas sencibles
plot(st_geometry(areas_sensibles), col = 'yellow', main = "Áreas Sensibles")


#Crear Mapas Temáticos:
library(ggplot2)
library(tmap)

# Ejemplo con ggplot2
ggplot() +
  geom_sf(data = uso_suelo2, fill = 'lightgreen') +
  geom_sf(data = areas_protegidas, fill = NA, color = 'red') +
  geom_sf(data = interseccion, fill = 'blue') +
  labs(title = "Mapa de Uso del Suelo y Áreas Protegidas")

# Ejemplo con tmap
tmap_mode("view")
tm_shape(uso_suelo) + tm_polygons("lightgreen") +
  tm_shape(areas_protegidas) + tm_borders("red") +
  tm_shape(interseccion) + tm_polygons("blue")
