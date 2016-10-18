library(shiny)
library(leaflet)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  titlePanel("Assignment R markdown and Leaflet"),
  h3("18th of October 2016"),
  p("Here follows a map of all the airports in Belgium."),
  p("The data used for has been download from the following site with their many thanks."),
  a("HDX", "https://data.humdata.org/dataset/ourairports-bel"),
  h3("Airports belgium"),
  strong("This is map with all airports in Belgium. These include international as small private airports."),
  leafletOutput("mymap")
 
))
