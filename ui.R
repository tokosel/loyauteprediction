library(shiny)

shinyUI(fluidPage(
  titlePanel(div("Prédiction de la loyauté des clients de Sendawal", style = "color: #6fbc30;")),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("produits", "Nombre de Produits Achetés :", value = 1, min = 1),
      numericInput("montant", "Montant Dépensé (Franc CFA) :", value = 100, min = 100),
      actionButton("predictBtn", "Prédire la Loyauté", style = "color: #ffffff; background-color: #6fbc30; border-color: #6fbc30;")
    ),
    mainPanel(
      h4("Résultat de la Prédiction :", style = "color: #6fbc30;"),
      verbatimTextOutput("predictionText")
    )
  )
))
