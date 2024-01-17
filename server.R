library(shiny)
library(MASS)

# Charger le modèle LDA
model <- readRDS("modele_lda.rds")

shinyServer(function(input, output) {
  
  observeEvent(input$predictBtn, {
    # Récupérer les valeurs entrées par l'utilisateur
    nombre_produits <- input$produits
    montant_depense <- input$montant
    
    # Effectuer la prédiction avec le modèle LDA
    new_data <- data.frame(Nombre.de.Produits.Achetes = nombre_produits,
                           Montant.Depense..Franc.CFA. = montant_depense)
    
    prediction <- predict(model, newdata = new_data)
    
    # Afficher la prédiction
    output$predictionText <- renderText({
      paste("La loyauté prédite du client est :", prediction$class)
    })
  })
})
