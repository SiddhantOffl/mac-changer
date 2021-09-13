#!/bin/bash
# Auto Mac Changer V1.0
# Coded by: SiddhantOffl
# Github: https://github.com/SiddhantOffl

## ANSI colors (FG & BG)
RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')"

## root Accese
if [ $(whoami) != "root" ]
then
	echo -e "\n${RED}[${WHITE}*${RED}]${ORANGE} Pleace Run With ${CYAN}[${RED}sudo${CYAN}] ${ORANGE}"${GREEN}
    exit 1
fi
clear


## About
about() {
	{ clear; echo; }
	cat <<- EOF



${ORANGE}	▄▀█ █░█ ▀█▀ █▀█   ▄▄   █▀▄▀█ ▄▀█ █▀▀
${RED}   	█▀█ █▄█ ░█░ █▄█   ░░   █░▀░█ █▀█ █▄▄ ${GREEN}V${ORANGE}1.${RED}0

		
		${GREEN}Author   ${RED}:  ${ORANGE}Siddhant ${RED}[ ${ORANGE}Saaho ${RED}]
		${GREEN}Github   ${RED}:  ${CYAN}https://github.com/SiddhantOffl

	EOF
}

hexchars="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
end=$( for i in {1..5} ; do echo -n ${hexchars:$(( $RANDOM % 16 )):2} ; done | sed -e 's/\(..\)/:\1/g' )

echo $end


## macchanger 
eth(){
	{ clear; about; }

    echo -e "\n${RED}[${WHITE}*${RED}]${ORANGE} Info Mac ${RED}[${CYAN}eth0${RED}] :${ORANGE}"${GREEN}
    echo ""
	sleep 0.2
    ifconfig eth0 | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'
    sleep 0.3
    echo -e "\n${RED}[${WHITE}*${RED}]${ORANGE} Launching Mac Changer... "
	echo -e "\n	${CYAN}Mac Changer...."
    sleep 0.5
	ifconfig eth0 down && ifconfig eth0 hw ether 22$end && ifconfig eth0 up
	echo -e "\n${RED}[${WHITE}*${RED}]${ORANGE} New Mac ${RED}[${CYAN}eth0${RED}] :${ORANGE}"${GREEN}
	echo ""
	sleep 0.2
    ifconfig eth0 | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'
	echo -ne "\n${RED}[${WHITE}-${RED}]${ORANGE} Waiting for New Mac Info, ${BLUE}Ctrl + C ${ORANGE}to exit. "
	echo ""
    sleep 7;
	./auto_mac.sh

}

wlan(){
	{ clear; about; }

    echo -e "\n${RED}[${WHITE}*${RED}]${ORANGE} Info Mac ${RED}[${CYAN}wlan0${RED}] :${ORANGE}"${GREEN}
    echo ""
	sleep 0.2
    ifconfig wlan0 | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'
    sleep 0.3
    echo -e "\n${RED}[${WHITE}*${RED}]${ORANGE} Launching Mac Changer... "
	echo -e "\n	${CYAN}Mac Changer...."
    sleep 0.5
	ifconfig wlan0 down && ifconfig wlan0 hw ether 33$end && ifconfig wlan0 up
	echo -e "\n${RED}[${WHITE}*${RED}]${ORANGE} New Mac ${RED}[${CYAN}wlan0${RED}] :${ORANGE}"${GREEN}
	echo ""
	sleep 0.2
    ifconfig wlan0 | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'
	echo -ne "\n${RED}[${WHITE}-${RED}]${ORANGE} Waiting for New Mac Info, ${BLUE}Ctrl + C ${ORANGE}to exit. "
	echo ""
    sleep 7;
	./auto_mac.sh

}

## main
eth



