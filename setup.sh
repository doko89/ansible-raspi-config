#!/bin/bash


if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi

dep (){
apt update
apt install -y python-pip virtualenv
virtualenv env
source env/bin/activate
pip install ansible
}

selesai (){
./env/bin/deactivate
}

menu (){
echo "Menu"
echo "1. install webserver"
echo "2. install mysql"
echo "3. isntall mikbotam"
echo "4. install mikhmon"
echo "5. install dns server (raspberry pi ubuntu arm only)"
read -p "pilih : " pilih
}

echo "starting..."
clear >$(tty)
dep

echo "starting..."
clear >$(tty)
menu

if [ "$pilih" -eq 1 ];then
	ansible-playbook -i source/inventory source/websrv.yml --extra-vars="interpreter_python= auto_silent"
elif [ "$pilih" -eq 2 ];then
	        ansible-playbook -i source/inventory source/mysql.yml --extra-vars="interpreter_python= auto_silent"
elif [ "$pilih" -eq 3 ];then
	read -p "Please Insert domain : (ex: mikbotam.domain.com) " domain
	ansible-playbook -i source/inventory source/mikbotam.yml --extra-vars="interpreter_python= auto_silent, domain=$domain"
elif [ "$pilih" -eq 4 ];then
	read -p "Please Insert domain : (ex: mikhmon.domain.com) " domain
        ansible-playbook -i source/inventory source/mikhmon.yml --extra-vars="interpreter_python= auto_silent, domain=$domain"
elif [ "$pilih" -eq 5 ];then
        ansible-playbook -i source/inventory source/dns.yml --extra-vars="interpreter_python= auto_silent"
else
	echo "pilihan yang anda masukkan salah"
	exit 0;
fi
	
menu
