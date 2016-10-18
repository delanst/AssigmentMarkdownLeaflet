library(shiny)
library(leaflet)
library(plyr)

airports <- read.csv("be-airports.csv", header = T)

shinyServer(function(input, output) {
    
    airportNames <- c("longitude_deg", "latitude_deg", "name")
    col.num <- which(colnames(airports) %in% airportNames)
    airportMarkers <- data.frame(airports[,col.num])
    airportMarkers = airportMarkers[-1,]
    airportMarkers[colSums(!is.na(airportMarkers)) > 0]
    airportMarkers <- rename(airportMarkers, c("latitude_deg"="lat", "longitude_deg"="lng", "name"="popup"))
    
    output$mymap <- renderLeaflet({
        airportMarkers %>% leaflet() %>%
            addProviderTiles("Esri.WorldImagery") %>%
            addMarkers()
    })
    
})
