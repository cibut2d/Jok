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
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1${NC} ${COLBG1}              ${WH}• DELETE USERS •                 ${NC}$COLOR1$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo ""
echo -e " $COLOR Yahhh, Tidak Ada Username Yang Terdaftar ${NC}"
echo ""
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
fi
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1${NC} ${COLBG1}              ${WH}• DELETE USERS •                 ${NC}$COLOR1$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo ""	
echo -e " $COLOR Pilih Nomer User Yang Akan Di Hapus ${NC}"
echo -e " $COLOR Tekan CTRL×C Untuk Membatalkan ${NC}"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
grep -E "^ " "/etc/passwd" | cut -d ' ' -f 2-3 | nl -s ') '
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
if [[ ${CLIENT_NUMBER} == '1' ]]; then
read -rp "Select Number [1]: " CLIENT_NUMBER
else
read -rp "Select Number [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
fi
done
Pengguna=$(grep -E "^ " "/etc/passwd" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
Days=$(grep -E "^ " "/etc/passwd" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^ $Pengguna $Days/d" /etc//etc/passwd
if getent passwd $Pengguna > /dev/null 2>&1; then
        userdel $Pengguna > /dev/null 2>&1
        echo -e "User $Pengguna was removed."
else
        echo -e "Failure: User $Pengguna Not Exist."
fi
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
