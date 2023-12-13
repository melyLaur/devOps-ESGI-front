#!/bin/bash

# Vérifier si la variable d'environnement est définie
if [ -z "$API_URL" ]; then
  echo "Erreur : la variable d'environnement DOCKER_API_URL n'est pas définie."
  exit 1
fi

# Trouver le fichier index*.js
INDEX_FILE=$(find . -type f -name 'index*.js' 2>/dev/null | head -n 1)

# Vérifier si le fichier existe
if [ -z "$INDEX_FILE" ]; then
  echo "Erreur : Aucun fichier index*.js trouvé."
  exit 1
fi

# Remplacer ${Rv.API_URL} par la valeur de la variable d'environnement
sed -i "s|\\SET_BACK_URL|$(echo "$API_URL" | sed 's/[\/&]/\\&/g')|g" "$INDEX_FILE"



echo "Remplacement terminé dans le fichier $INDEX_FILE."
#cat $INDEX_FILE | grep API_URL

# Redémarrer le serveur Nginx
echo "Redémarrage du serveur Nginx..."
#service nginx restart

echo "Serveur Nginx redémarré avec succès."
exec nginx -g 'daemon off;'
#exec "$@"