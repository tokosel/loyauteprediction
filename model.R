# Import des librairies utiles
library(dplyr)
library(ggplot2)
library(caret)
library(MASS)
#library(shiny)

# Import des données
df = read.csv("sendawal.csv")

#Exploration initiale
head(df)
# Résumé statistique
summary(df)

# Distribution de la variable loyauté
table(df$Loyaute)

# Distribution des variables numériques
hist(df$Nombre.de.Produits.Achetes, main = "Distribution du Nombre de Produits Achetés", xlab = "Nombre de Produits Achetés")
hist(df$Montant.Depense..Franc.CFA., main = "Distribution du Montant Total Dépensé (Franc CFA)", xlab = "Montant Total Dépensé (Franc CFA)")

# Boîte à moustaches pour la variable Montant.Depense..Franc.CFA.
boxplot(df$Montant.Depense..Franc.CFA., main = "Boîte à Moustaches du Montant Total Dépensé (Franc CFA)", ylab = "Montant Total Dépensé (Franc CFA)")

# Fréquence des niveaux de la variable Loyaute
barplot(table(df$Loyaute), main = "Fréquence des Niveaux de Loyaute", xlab = "Loyaute")

# Relation entre Montant.Depense..Franc.CFA. et Nombre.de.Produits.Achetes
plot(df$Montant.Depense..Franc.CFA., df$Nombre.de.Produits.Achetes, main = "Relation entre Montant Total Dépensé et Nombre de Produits Achetés", xlab = "Montant Total Dépensé (Franc CFA)", ylab = "Nombre de Produits Achetés")

# Vérification des valeurs manquantes 
sum(is.na(df))# On voit qu'il n'y a pas de VM

# Tests de normalité

# Test de Shapiro wilk
shapiro.test(df$Montant.Depense..Franc.CFA.)
shapiro.test(df$Nombre.de.Produits.Achetes)

# Test de Kolmogorov-Smirnov
ks.test(df$Montant.Depense..Franc.CFA.,"pnorm", mean(df$Montant.Depense..Franc.CFA.), sd(df$Montant.Depense..Franc.CFA.))
ks.test(df$Nombre.de.Produits.Achetes,"pnorm", mean(df$Montant.Depense..Franc.CFA.), sd(df$Montant.Depense..Franc.CFA.)) 


# Analyse Discriminante Quadratique

# Sélection des variables explicatives et de la variable à prédire 
df_model <- df[, c("Loyaute","Montant.Depense..Franc.CFA.","Nombre.de.Produits.Achetes")]
# Diviser les données en ensemble d'apprentissage et de test
set.seed(123)
index <- sample(1:nrow(df), 0.7 * nrow(df))
train <- df_model[index, ]
train
test <- df[-index, ]
test
# Modélisation

# Créer un modèle LDA
model <- lda(Loyaute ~ ., data = train)
model
summary(model)

# Évaluation du modèle

# Prédire sur l'ensemble de test
prediction <- predict(model, newdata = test)
prediction
# Probabilités d'appartenance à chaque classe pour les premières observations
head(predict(model, newdata = test, type = "response")$posterior)

# Matrice de confusion
Matrice <- table(Loyaute = test$Loyaute, Predite = prediction$class)
Matrice

# Taux de classification
accuracy <- sum(diag(Matrice)) / sum(Matrice)
accuracy

# Sauvegarder le modèle LDA
saveRDS(model, file = "modele_lda.rds")




