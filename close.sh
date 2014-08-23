#!/bin/bash

echo "Version 0.1"
echo
echo "##########################################"
echo "           Closing doors script!!"
echo "##########################################"
echo

host=$HOSTNAME

function print_good ()
{
	echo -e "\x1B[01;32m[*]\x1B[0m $1"
}


function print_error ()
{
	echo -e "\x1B[01;31m[*]\x1B[0m $1"
}
function print_status ()
{
	echo -e "\x1B[01;34m[*]\x1B[0m $1"
}

function stop_service ()
{
	service "$1" stop
}


if [ $USER = root ]
then

	if [ $HOSTNAME = CyberEco ]
	then
	echo -e "\x1B[01;34mMáquina:\x1B[0m \x1B[01;32mCyberEco\x1B[0m"
	echo
	print_status "Fechando POSTGRESQL"
	
	if stop_service postgresql;then
	print_good "Finalizado!"
	else
	print_error "Algo deu errado."
	fi

	print_status "Fechando CUPS"
	if stop_service cups;then
	print_good "Finalizado!"
	else
	print_error "Algo deu errado"
	fi

	fi

	if [ $HOSTNAME = Prog2 ]
	then
	echo "Máquina: Prog2"
	echo
	echo "Fechando CUPS"
	service cups stop
	echo "CUPS Encerrado"

	echo "Fechando APACHE2"
	service apache2 stop
	echo "APACHE2 Encerrado"

	echo "Fechando o VMWARE"
	service vmware stop
	service vmware-workstation-server stop
	echo "VMWARE Encerrado"
	fi

	if [ $HOSTNAME = Debian ]
	then
	echo "Máquina: Debian"
	echo 
	echo"Fechando CUPS"
	service cups stop
	echo "Fechando APACHE2"
	service apache2 stop
	echo "Fechando "
	fi

	echo 
	echo "##########################################"
	echo "            Close.sh Encerrado!           "
	echo "##########################################"
	echo

else

echo "Você precisar logar com o usúario root para rodar o Close.sh"
echo 
fi







