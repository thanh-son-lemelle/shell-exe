#!/bin/bash
# Ajout de la variable dateheure au format (jour-mois-année-heure: minute)
dateheure=$(date +"%d-%m-%Y-%H:%M")
echo "$dateheure"
# Ajout de la variable nbrconnection et création d'un fichier contenant la valeur de la variable
nbrconnection=$(last lmll | grep "lmll" | wc -l)
echo " $nbrconnection " > "number_connection-$dateheure"
#compression du fichier vers le répertoire Backup
tar -cvf ~/Documents/projectshell.exe/Job08/Backup/number_connection-$dateheure.tar number_connection-$dateheure

