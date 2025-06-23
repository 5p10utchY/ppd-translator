#!/bin/bash

# Vérifiez que le bon nombre d'arguments est passé
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <fichier_cible> <fichier_annexe>"
    exit 1
fi

fichier_cible="$1"
fichier_annexe="$2"

# Vérifiez que le fichier cible existe
if [ ! -f "$fichier_cible" ]; then
    echo "Le fichier cible '$fichier_cible' n'existe pas."
    exit 1
fi

# Vérifiez que le fichier annexe existe
if [ ! -f "$fichier_annexe" ]; then
    echo "Le fichier annexe '$fichier_annexe' n'existe pas."
    exit 1
fi

# Créer une copie du fichier cible
fichier_nouveau="${fichier_cible%.txt}_modifie.txt"
cp "$fichier_cible" "$fichier_nouveau"

# Lire le fichier annexe et effectuer les remplacements
while IFS='|' read -r ancien nouveau; do
    # Utiliser sed pour remplacer les phrases dans le nouveau fichier
    sed -i "s|$ancien|$nouveau|g" "$fichier_nouveau"
done < "$fichier_annexe"

echo "Remplacements effectués dans '$fichier_nouveau'."
