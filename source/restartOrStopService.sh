#!/bin/bash
#SYNOPSYS restartOrStopService [restart|stop] [service|all]
#Pour redemarrer les services  recoit start ou stop ou restart ou plus les parametres services
#Ici nous considerons que start est égal à restart
#DETAILS
#	all tous les services
#	start demarrer le service
# 	stop arreter le service
#	restart redemarrer le service
#Dans le cas ou on n'a pas envoyé de paramètre on redemarre tous les service 

declare -A service
service[apache2]="apache2"
service[nginx]="nginx"
service[postfix]="postfix"
service[dovecot]="dovecot"
service[phpfpm]="php7.2-fpm"
#service[spamassassin]="spamassassin"
#service[vsftpd]="vsftpd"
serviceValeur="none" # utile pour  la fonction 
#On initialise retour à 1 c'est à dire echec 
retour=1
function restartOrStopService ()
{
	systemctl status $serviceValeur | grep 'active (running)' > /dev/null 2>&1
	if [ $? = 0 ]
	then
		systemctl restart $serviceValeur > /dev/null 2>&1
		if [ $? = 0 ]
		then 
			retour=0
		else
			retour=1
		fi
	else
		#On fait des verification plus poussées pour être sur que la commande n'est pas active afin de pouvoir redémarrer
		systemctl is-active $serviceValeur > /dev/null 2>&1
		#Si on est sur que le service est actif alors on le redémarre (restart) sinon on le démarre (start)
		if [ $? = 0 ]
		then
			systemctl restart $serviceValeur > /dev/null 2>&1
			if [ $? = 0 ]
			then 
				retour=0
			else
				retour=1
			fi
			
		else
			systemctl start $serviceValeur > /dev/null 2>&1
			if [ $? = 0 ]
			then 
				retour=0
			else
				retour=1
			fi
		fi
	
	fi
}
#Si on a envoyé aucun parametre ou qu'on a envoyé $0 restart all
if [ $# = 0 ] || ( [ $1 = 'restart' ] && [ $2 = 'all' ]  )
then
	#Cas de apache2
	# On verifie l'etat du service apache2 ensuite on redemarre	
	serviceValeur="apache2"
	restartOrStopService

	#Cas de nginx
	serviceValeur="nginx"
	restartOrStopService

	#Cas de php7.2-fpm
	# On verifie l'etat du service ensuite on redemarre	
	serviceValeur="php7.2-fpm"
	restartOrStopService

	#Cas de dovecot
	serviceValeur="postfix"
	restartOrStopService

	#Cas de dovecot
	serviceValeur="dovecot"
	restartOrStopService		

	#A la fin on retourne le code qui caracterise l'eatat du programme reussite 0 ou echec 1
	exit $retour

#Si on a fait $0 restart avec $0 le nom du service en question
elif  [ $1 = "restart" ]
then
	for key in "${!service[@]}"; do
		if [[ $key = $2 ]]; then
			serviceValeur=$2
			restartOrStopService
			#On quitte la fonction et arrete le programme
			exit $retour
		fi
	done
elif  [ $1 = "stop" ]
then
	for key in "${!service[@]}"; do
		# Nous ne pouvons pas arreter le service web ni le service php sinon on ne peut plus y acceder via l'interface web
		if [ $key = $2 ] && [ $2 != "nginx" ] && [ $2 != "apache2" ] && [ $2 != "phpfpm" ]; then
			systemctl status $2 | grep 'active (running)' > /dev/null 2>&1
			if [ $? = 0 ]
			then
				systemctl stop $2 > /dev/null 2>&1
				if [ $? = 0 ]
				then 
					exit 0
				else
					exit 1
				fi
			else
				#On fait des verification plus poussées pour etre sur que la commande est active afin de pouvoir arreter le service en question
				systemctl is-active $2 > /dev/null 2>&1
				#Si on est sur que le service est actif alors on l'arrete
				if [ $? = 0 ]
				then
					systemctl stop $2 > /dev/null 2>&1
					if [ $? = 0 ]
					then 
						exit 0
					else
						exit 1
					fi
				else
					exit 0
				fi
			fi
		fi
	done
fi
