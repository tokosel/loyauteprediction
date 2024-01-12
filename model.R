# Import des librairies utiles
#install.packages("shiny")
#install.packages("nortest")


library(dplyr)
library(ggplot2)
library(caret)
library(MASS)
library(nortest)
library(shiny)

# Import des données
df = read.csv("sendawaldataset.csv")

#Exploration initiale
head(df)
summary(df)

# Vérification des valeurs manquantes 
sum(is.na(df))
# On voit qu'il n'y a pas de VM

# Test de normalité

# Test de Shapiro wilk
shapiro.test(df$Montant.Depense..Franc.CFA.)
shapiro.test(df$Nombre.de.Produits.Achetes)

# Test de Kolmogorov-Smirnov
ks.test(df$Montant.Depense..Franc.CFA.,"pnorm", mean(df$Montant.Depense..Franc.CFA.), sd(df$Montant.Depense..Franc.CFA.))
ks.test(df$Nombre.de.Produits.Achetes,"pnorm", mean(df$Montant.Depense..Franc.CFA.), sd(df$Montant.Depense..Franc.CFA.)) 

# Préparation des données 
df$Drug = factor(df$Drug)
