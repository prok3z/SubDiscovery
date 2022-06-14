#!/bin/bash

#Color 
DO="\e[0;49;95m"
PINK="\e[0;49;35m"
RED="\e[0;49;31m"
GREEN="\e[0;49;91m"
Gcyan="\e[0;49;33m"
Cyan="\e[0;49;36m"
STOP="\e[0m"

domain=$1

logo(){

echo " __.   .    .__  Automation for SubDomains"                        
echo "(__ . .|_   |  \* __ _. _ .  , _ ._.  ."
echo ".__)(_|[_)  |__/|_) (_.(_) \/ (/,[  \_|"
echo "                           @prok3z  ._|"


}
passive_enum(){
subfinder -d $domain -o subfin
assetfinder -subs-only $domain | tee asset
amass enum -passive -d $domain -o passive.txt
findomain -t $domain -q -u find
}

if [ "$1" ];then
	passive_enum
elif [ "$0" ];then
	logo	
fi


