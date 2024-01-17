library(shiny)

shinyUI(fluidPage(
  titlePanel("Prédiction de la Loyauté du Client"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("produits", "Nombre de Produits Achetés :", value = 1, min = 1),
      numericInput("montant", "Montant Dépensé (Franc CFA) :", value = 100, min = 0),
      actionButton("predictBtn", "Prédire la Loyauté")
    ),
    mainPanel(
      h3("Résultat de la Prédiction :"),
      verbatimTextOutput("predictionText")
    )
  )
))
