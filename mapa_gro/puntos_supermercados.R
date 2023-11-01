library(tidyverse)
#library(DataExplorer)
library(dplyr)
library(ggplot2)
library(lubridate)
library(stringr)
library(htmlwidgets)
rm(list = ls())

dta<- read.csv("~/Documents/datos/supermercados_gro.csv",stringsAsFactors = F)

dta <- dta %>% filter(raz_social %in% c("NUEVA WAL MART DE MEXICO S DE RL DE CV", "TIENDAS SORIANA SA DE CV", "TIENDAS CHEDRAUI SA DE CV"))


pal <- colorFactor(
  palette = colorRampPalette(c("red", "blue", "yellow"))(length(dta$raz_social)), 
  domain = dta$raz_social)
    
leaflet(dta) %>% 
  addTiles() %>% 
  addCircleMarkers(radius = 3,lng = dta$longitud, 
                   lat=dta$latitud, 
                  color = ~pal(raz_social),
             popup =~htmlEscape(paste0("municipio:", municipio, ",", " ", "razón social:", raz_social)) ) %>% 
  addLegend("bottomright", pal = pal, values = ~raz_social,
            title = "Supermercado")


 
    
   
    saveWidget(m, file="~/Documents/datos/supermercadostop3_gro.html")



