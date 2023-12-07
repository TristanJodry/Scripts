 #!/bin/bash
quitter=1
retour=0
while [[ $quitter -ne 0 ]]
do
	echo -e "Menu :\n1- Recherche de chemins\n2-A savoir avant de lancer le programme\n3-Super elevation d'utilisateur\n0- Quitter"
	read choix1
	case $choix1 in
	1 )
	echo "Je souhaite afficher le chemin de la commande :"
	read commande1
	whereis $commande1
	;;
	2 )
	echo "A savoir avant de lancer le programme :"
	echo "1. Chaque erreur d'ecriture peut bloquer votre machine,"
	echo "Veuillez donc verifier l'orthographe de chacune de vos interactions"
	echo "2. Au moment de saisir le chemin, veuillez renseigner le chemin absolu de la commande," 
	echo "visible dans l'onglet 'recherche de chemin'."
	;;
	3 )
	echo "Bonjour, bienvenue dans le processus de superélévation d'utilisateur."
	echo "Avant de commencer, veuillez vous assurer de bien être en superutilisateur, ou 'root'"
	echo "Quel utilisateur voulez-vous élever ?"
	read user
	echo "Sur quelle machine voulez-vous élever l'utilisateur ?"
	echo "(Pour toutes les machines, veuillez noter 'ALL' en majuscule.)"
	read machine
	echo "Quelle est la commande que vous voulez autoriser à utiliser ?"
	read commande2
	echo "Quelle est le chemin de la commande ?"
	read chemin
	#Veuillez modifier le /test vers le fichier qui désigne les délégations
	echo -e "$user $machine=(root) $chemin/$commande2" > /test
	echo "L'utilisateur "$user" a bien été autorisé à utiliser la commande "$commande" sur la machine" $machine
	;;
	0 )
	quiter=0
	figlet "Au revoir"
	exit
	;;
	* )
	echo "Erreur dans la saisie"
	;;

esac
done
