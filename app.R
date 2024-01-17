library(shiny)

# Lancer l'application Shiny
shinyApp(ui = source("ui.R")$value, server = source("server.R")$value)
