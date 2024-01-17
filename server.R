library(shiny)
library(MASS)

# Charger le modèle LDA
model <- readRDS("modele_lda.rds")

shinyServer(function(input, output, session) {
  
  observe({
    # Envoyer les placeholders aux champs numériques
    session$sendCustomMessage(type = "placeholder", list(id = "produits", value = "Entrez le nombre de produits"))
    session$sendCustomMessage(type = "placeholder", list(id = "montant", value = "Entrez le montant dépensé"))
  })
  
  observeEvent(input$predictBtn, {
    # Récupérer les valeurs entrées par l'utilisateur
    nombre_produits <- input$produits
    montant_depense <- input$montant
    
    # Vérifier les contraintes
    if (is.null(nombre_produits) || is.null(montant_depense) || nombre_produits <= 0 || montant_depense <= 0) {
      # Afficher un message d'erreur temporaire
      showNotification("Le nombre de produits et le montant dépensé doivent être supérieurs à zéro.", type = "error", duration = 10)
      
    } else {
      
      # Effectuer la prédiction avec le modèle LDA
      new_data <- data.frame(Nombre.de.Produits.Achetes = nombre_produits,
                             Montant.Depense..Franc.CFA. = montant_depense)
      
      prediction <- predict(model, newdata = new_data)
      
      # Afficher la prédiction
      output$predictionText <- renderText({
        paste("La loyauté prédite de ce client est :", prediction$class)
      })
    }
  })
})