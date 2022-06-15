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

echo -e "${Cyan} __.   .    .__  Automation for SubDomains                        
(__ . .|_   |  \* __ _. _ .  , _ ._.  .
.__)(_|[_)  |__/|_) (_.(_) \/ (/,[  \_|
                           @prok3z  ._|"


}
passive_enum(){
subfinder -d $domain -o subfin
assetfinder -subs-only $domain | tee asset
amass enum -passive -d $domain -o passive.txt
findomain -t $domain -q -u find
cat subfin asset passive.txt find > urls
cat urls | anew hosts
cat hosts | httpx -silent -timeout 50 -mc 200 -o domains
rm -rf subfin asset passive.txt find hosts
echo "Scan Finalizado"
}

if [ "$1" ];then
	passive_enum
elif [ "$0" ];then
	logo	
fi


