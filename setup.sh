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

echo "starting..."
clear >$(tty)
dep

echo "starting..."
clear >$(tty)
echo "Menu"
echo "1. setup webserver"
echo "2. isntall mikbotam"
echo "3. install mikhmon"
echo "4. install dns server (raspberry pi ubuntu arm only)"
read -p "pilih : " pilih

if [ "$pilih" -eq 1 ];then
	ansible-playbook -i source/inventory source/websrv.yml --extra-vars="interpreter_python= auto_silent"
elif [ "$pilih" -eq 2 ];then
	read -p "Please Insert domain : (ex: mikbotam.domain.com) " domain
	ansible-playbook -i source/inventory source/mikbotam.yml --extra-vars="interpreter_python= auto_silent, domain=$domain"
elif [ "$pilih" -eq 3 ];then
	read -p "Please Insert domain : (ex: mikhmon.domain.com) " domain
        ansible-playbook -i source/inventory source/mikhmon.yml --extra-vars="interpreter_python= auto_silent, domain=$domain"
elif [ "$pilih" -eq 4 ];then
        ansible-playbook -i source/inventory source/dns.yml --extra-vars="interpreter_python= auto_silent"
else
	echo "pilihan yang anda masukkan salah"
fi
	

