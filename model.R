# Import des librairies utiles
#install.packages("shiny")
library(dplyr)
library(ggplot2)
library(caret)
library(MASS)
library(shiny)

# Import des données
df = read.csv("sendawaldataset.csv")

#Exploration initiale
head(df)
summary(df)

# Vérification des valeurs manquantes 
sum(is.na(df))
# On voit qu'il n'y a pas de VM

# Préparation des données 
df$Drug = factor(df$Drug)
