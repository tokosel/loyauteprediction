#Projet final du module Analyse dicriminante  Master 1 SID CRD UADB
#Abdoulaye SALL
#Dépôt Github: https://github.com/tokosel/Examen-final-programmation-R
#App

library(shiny)

# Lancer l'application Shiny
shinyApp(ui = source("ui.R")$value, server = source("server.R")$value)
