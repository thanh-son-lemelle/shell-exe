#!/bin/bash
# Initialisation de la boucle 
if [ "$1" == "hello" ];
then
	# Si l'argument a la valeur "hello" faire :
	echo "Bonjour, je suis un script !"

elif [ "$1" == "bye" ];
then
	# Si l'argument a la valeur "byeé faire : 
  	echo "Au revoir et bonne journée !"
else
	# sinon :
  	echo "Argument pas pris en compte veuillez utiliser hello ou bye"
fi
