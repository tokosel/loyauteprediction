# Import des librairies utiles
#install.packages("shiny")
library(dplyr)
library(ggplot2)
library(caret)
library(MASS)
library(shiny)

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

# Utilisez la fonction pairs() pour examiner les relations entre toutes les paires de variables numériques
pairs(df[, c("Nombre.de.Produits.Achetes", "Montant.Depense..Franc.CFA.")])

# Vérification des valeurs manquantes 
sum(is.na(df))
# On voit qu'il n'y a pas de VM

# Tests de normalité

# Test de Shapiro wilk
shapiro.test(df$Montant.Depense..Franc.CFA.)
shapiro.test(df$Nombre.de.Produits.Achetes)

# Test de Kolmogorov-Smirnov
ks.test(df$Montant.Depense..Franc.CFA.,"pnorm", mean(df$Montant.Depense..Franc.CFA.), sd(df$Montant.Depense..Franc.CFA.))
ks.test(df$Nombre.de.Produits.Achetes,"pnorm", mean(df$Montant.Depense..Franc.CFA.), sd(df$Montant.Depense..Franc.CFA.)) 


# Analyse Discriminante Quadratique (LDA)