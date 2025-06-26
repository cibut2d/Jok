#!/bin/bash
# //====================================================
# //	System Request:Debian 9+/Ubuntu 18.04+/20+
# //	Author:	Julak Bantur
# //	Dscription: Xray MultiPort
# //	email: putrameratus2@gmail.com
# //  telegram: https://t.me/Cibut2d
# //====================================================
# // font color configuration | JULAK BANTUR AUTOSCRIPT
###########- COLOR CODE -##############
colornow=$(cat /etc/julak/theme/color.conf)
VC="\e[0m"
Green="\e[92;1m"
BICyan='\033[1;96m'
BIYellow='\033[1;93m'
COLOR1="$(cat /etc/julak/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/julak/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
y='\033[1;33m' #yellow
l='\033[0;37m'
BGX="\033[42m"
CYAN="\033[96m"
z="\033[96m"
zx="\033[97;1m" # // putih
RED='\033[0;31m'
NC='\033[0m'
gray="\e[1;30m"
Blue="\033[0;34m"
green='\033[1;32m'
grenbo="\e[92;1m"
purple="\033[1;95m"
YELL='\033[0;33m'
cyan="\033[1;36m"
c="\033[5;33m"
###########- END COLOR CODE -##########
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^ " "/etc/passwd")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
    echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
    echo -e "\e[42m       SSH OVPN User Detail Account      \E[0m"
    echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
    echo ""
    echo "You have no existing clients!"
    echo ""
    echo -e "\033[1;93m─────────────────────────────────────────\033[0m"

fi

clear
echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
echo -e "\e[42m       SSH OVPN User Detail Account      \E[0m"
echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
if [[ -e /etc/ssh/.ssh.db ]]; then
    NAMEUSER=$(grep -E "^ " "/etc/passwd" | cut -d ' ' -f 2 | nl -s '. ')
    echo -e " \e[032;1mAccount Client\e[0m :"
    echo -e "$NAMEUSER"
    echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
fi
read -p "Input Name Account : " user
clear
if [[ -e /etc/xray/log-createssh-${user}.log ]]; then
    cat /etc/xray/log-createssh-${user}.log
else
    echo "You have no existing clients!"
fi
echo ""

