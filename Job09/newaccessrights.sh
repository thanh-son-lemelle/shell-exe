#!/bin/bhash

#variables
nbr_donnees=-1
nbr_utilisateur=$(($(cat ./Shell_Userlist.csv | wc -l)-1))

# Déclarer un tableau associatif pour stocker les données
declare -A utilisateurs

# Lire le fichier ligne par ligne et traiter les données
while IFS="," read -r id prenom nom mot_de_passe role; do
        # Enregistrer les données dans le tableau associatif
        utilisateurs["$id"]="$prenom,$nom,$mot_de_passe,$role"
        echo "$prenom"
        echo "$nom"
        echo "$mot_de_passe"
        echo "$role"
        echo "$utilisateurs[$id]"
        echo "------"
done < Shell_Userlist.csv

# Accéder aux données pour un utilisateur spécifique (par exemple, l'utilisateur 1001)
echo "Données de l'utilisateur 1001 : ${utilisateurs[1001]}"
echo "${!utilisateurs[@]}"
# Parcourir et traiter toutes les données
for utilisateur_id in "${!utilisateurs[@]}"; do
        donnees="${utilisateurs[$utilisateur_id]}"
        # Diviser les données en utilisant la virgule comme séparateur pour obtenir les éléments indivi>
        IFS=',' read -ra elements <<< "$donnees"
        nom="${elements[0]}"
        prenom="${elements[1]}"
        mot_de_passe="${elements[2]}"
        role="${elements[3]}"
        # Afficher les éléments nécessaires
        echo "ID de l'utilisateur : $utilisateur_id"
        echo "Nom : $nom"
        echo "Prénom : $prenom"
        echo "Mot de passe : $mot_de_passe"
	echo "Rôle : $role"
        # Décompte des utilisateurs enregistrés
        nbr_donnees=$((nbr_donnees+1))
        # Encryptage du mot de passe 
        pass_crypte=$(mkpasswd -m sha-512 "$mot_de_passe")
        # Ajout d'utilisateur
        if [ "$role" = "User" ]; then
                sudo useradd --badname -u "$utilisateur_id" -s /bin/bash -m -G users -p "$pass_crypte" >
        elif [ "$role" = "Admin" ]; then
                sudo useradd --badname -u "$utilisateur_id" -s /bin/bash -m -G sudo -p "$pass_crypte" ">
        fi
        # Modification des utilisateurs 
        sudo chfn -f "$nom $prenom" "$nom"
        sudo usermod -aG job09 "$nom"
        echo "---"
done
# Controle des entrées et des sorties
echo "nbr utilisateur donné = $nbr_utilisateur"
echo "nbr utilisateur sauvegardé = $n"
if ["$nbr_utilisateur"="$n"]; do 
        echo "maj OK"
else 
        echo "erreur"
fi
