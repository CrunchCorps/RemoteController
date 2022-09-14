##/Coded/--/by/--/Bakeneko/--[From/3/to/9/2022]--/crunchCorps/--/JACURUTU/##
#!/bin/bash
#init


if ! [ $(id -u) = 0 ]; then ##ref: https://askubuntu.com/a/30157/8698
    echo -e "${DGR}"
    echo "The script need to be run as root." >&2
    exit 1
fi
#test if root. If not--bail out and advice user to run 'sudo'.
if [ $SUDO_USER ]; 
    then
        real_user=$SUDO_USER
    else
        real_user=$(whoami)
fi

nipePath=$(dirname $(locate nipe.pl)) #Nipe Location path.
DGR='\033[0;32m' #Color DarkGreen.
GR='\033[1;32m' #Color Green.
STOP='\033[0m' #Return to Standard Color.

function START()
{

clear
echo -n -e "${GR}"
echo -n "Checking for repositories needed of installation before the opening sequence "
echo -n -e "${GR}."
sleep 1
echo -n -e "${GR}."
sleep 1
echo -n -e "${GR}."
sleep 1
echo ""
if [[ $(aptitude show figlet | grep "State" | cut -d":" -f2) = "installed" ]]; then
    #Checking if figlet is already installed. If not, install it as it required for opening sequence.
    echo -e "${DGR}Installing figlet repositories."
    echo -n -e "${GR}" | sudo apt-get install figlet && sudo apt-get update figlet
    echo ""
    echo ""
    echo -e "${GR} figlet installion completed".
    #Installation and update of figlet for opening sequence.
    break
fi
if [[ $(aptitude show cmatrix | grep "State" | cut -d":" -f2) = "installed" ]]; then
    #Checking if cmatrix is already installed. If not, install it as it required for opening sequence.
    echo -e "${DGR}Installing cmatrix repositories."
    echo -n -e "${GR}" | sudo apt-get install cmatrix && sudo apt-get update cmatrix
    echo ""
    echo ""
    echo -e "${GR} cmatrix installion completed".
    #Installation and update of CMATRIX for opening sequence.
    break
fi
clear
echo -n -e "${GR}"
echo -n "Initilatizing opening sequence"
sleep 1
echo -n -e "${GR}."
sleep 1
echo -n -e "${GR}."
sleep 1
echo -n -e "${GR}."
clear
#Opening Sequence commencing.
cmatrix -u10 -s #cmatrix by Oisin Grehan
echo -e "${DGR} ---~=JACURUTU LIVES=~---" | sed 's/^/                                                                           /'
echo ""
echo -n -e "${GR}"
figlet -f standard "Welcome" | sed 's/^/                                                                  /'
figlet -f standard "to a Virtual" | sed 's/^/                                                             /' 
figlet -f standard "Private Server" | sed 's/^/                                                         /'
figlet -f standard "Access" | sed 's/^/                                                                       /'
echo -e "${DGR} Bakeneko [9-2022]" | sed 's/^/                                                                             /'
echo -e "${DGR} v2.46" | sed 's/^/                                                                                    /'

read -s -t 3
echo ""
echo ""
echo -n -e "${STOP}"
echo -n -e "${DGR}"
echo "In order to proceed, please identify yourself. " 
sleep 0.5
echo "A surname will be sufficent."
sleep 1
echo -n -e "What is your name? \033[1;32m"
read usrName
clear
if [[ $usrName == z||Z ]]; then
    echo -e "\e[1;31mZed is dead, baby. Zed is dead."
    sleep 2
    echo "You have entered a backdoor allowing you to skip ahead."
    sleep 3
    echo -n -e "${DGR}"
    SCANCHK
    #Backdoor to skip ahead 60% of the script.
else
    echo -n "

"
    echo -n -e "${DGR}"
    echo -e "Greetings, ${GR}"$usrName"."
    echo -n -e "${DGR}"
    sleep 2
    echo ""
    echo "This script sole puropse is to check for your anonymousity."
    sleep 0.5
    echo -n "and then allowing you an access "
    sleep 0.5
    echo "to a Virtual Private Server, " 
    sleep 0.5
    echo "where you will be asked of a Target IP address required"
    sleep 0.5
    echo "to execute NMAP Scans and WHOIS queries."
    echo ""
    sleep 2
    echo ""
fi

INSTPKGS
}

function INSTPKGS()
#Installing relevant packages
{
echo -n -e "${DGR}"
echo "Updating and upgrading system repositories and additional packages."
echo -n -e "\033[1;32m" sudo apt update && sudo apt-get update && sudo apt-get dist-upgrade -y
#Updates packages' index files and upgrade missing repositories.
echo ""
echo -n -e "${DGR}Checking for missing packages required to run the script"
sleep 1
echo -n -e "${GR}."
sleep 1
echo -n -e "${GR}."
sleep 1
echo -n -e "${GR}."
echo ""

progupdate=("cpan" "nipe" "ssh" "sshpass" "nmap" "whois")
for i in "${progupdate[@]}"
#Comparing program to array and checking if the program is already installed. If so, skip installation.
do
    #Installation and update of packages from CPAN (required for NIPE to run in perl)
    if [ "${progupdate[0]}" == 'cpan' ] && [ $(locate cpan | grep --only-matching "/usr/bin/cpan" | sort --unique | cut -d"/" -f4) != 'cpan' ]; then
        echo -e "${DGR}Installing and Updating PERL repositories."
        echo ""
        echo -n -e "${GR}"
        sudo apt-get install perl build-essential curl
        echo -e "${DGR}Installing and Updating CPAN repositories."
        cpan install &
        cpan reload &
        cpan install Try::Tiny Config::Simple JSON &
        echo "Done."
        echo ""
        echo -e "${DGR}CPAN installion completed."
        echo ""
        continue
    fi

    if [ "${progupdate[1]}" == "nipe" ] && [ "$(locate nipe | grep --only-matching "nipe.pl" | sort --unique)" != "nipe.pl" ]; then
        echo -e "${DGR}Cloning NIPE from Github repositories."
        echo ""
        echo -n -e "${GR}"
        #Installation and update of NIPE with perl and TOR's Databases.
        git clone https://github.com/htrgouvea/nipe.git 2> /dev/null
        #Cloning Nipe from Github.
        echo ""
        echo -e "${DGR}Installing and Updating NIPE and TOR repositories in perl."
        echo "" 
        echo -n -e "${GR}"
        cd $nipePath && sudo apt-get install -y tor | head -n -2 && sudo apt-get upgrade tor
        echo "Done."
        echo ""
        echo -e "${DGR}Nipe, Perl, and TOR installion completed."
        break
    fi

    if [ "${progupdate[2]}" == "ssh" ] && [ "$(aptitude show ssh | grep "State" | cut -d":" -f2)" != "installed" ]; then
        echo -e "${DGR}Installing and Updating SSH repositories."
        echo ""
        echo -n -e "${GR}"
        sudo apt-get install ssh | head -n -3 && sudo apt-get upgrade ssh
        echo "Done."
        echo ""
        echo -e "${DGR}SSH installion completed."
        echo ""
        break
    fi

    if [ "${progupdate[3]}" == "sshpass" ] && [ "$(aptitude show sshpass | grep "State" | cut -d":" -f2)" != "installed" ]; then
        echo -e "${DGR}Installing and Updating SSHPASS repositories."
        echo ""
        echo -n -e "${GR}"
        sudo apt-get install sshpass -y | head -n -3 && sudo apt-get upgrade sshpass
        echo "Done."
        echo ""
        echo -e "${DGR}SSHPASS installion completed."
        echo ""
        break
    fi

    if [ "${progupdate[4]}" == "nmap" ] && [ "$(aptitude show nmap | grep "State" | cut -d":" -f2)" != "installed" ]; then
        echo -e "${DGR}Installing and Updating NMAP repositories."
        echo ""
        echo -n -e "${GR}"
        sudo apt-get install nmap | head -n -3 && sudo nmap --script-updatedb | head -n -3 && sudo apt-get upgrade nmap
        echo "Done."
        echo ""
        echo -e "${GR}nmap installion completed."
        break
    fi

    if [ "${progupdate[5]}" == "whois" ] && [ "$(aptitude show whois | grep "State" | cut -d":" -f2 | head -n -2)" != "installed" ]; then
        echo -e "${DGR}Installing and Updating WHOIS repositories."
        echo ""
        echo -n -e "${GR}"
        sudo apt-get install whois | head -n -3 && sudo apt-get upgrade whois
        echo "Done."
        echo ""
        echo -e "${GR}whois installion completed."
        sleep 3
        clear
        break
    fi
    sudo apt-get autoremove -y
    echo -e "${GR}Required repositories have been installed."
    echo "" 
    echo -n -e "${DGR}"
    sleep 3
    ANON
done
#If packages are already installed, skipping to next function.
echo ""
echo -e "${DGR}Required packages already installed and we are may proceed."
echo -n -e "${DGR}"
echo ""
sleep 3
ANON
}

function ANON()
{ 
    #Anonymity checker
    clear
    echo -n "




"
    echo -n -e "${DGR}"
    echo "Checking for your anonymity:" 
    echo ""
    echo -n -e "${GR}"
    sleep 0.3 | echo -n "." 
    sleep 0.3 | echo -n "."
    sleep 0.3 | echo -n "."
    sleep 0.3 | echo -n "15%" 
    sleep 0.3 | echo -n "."
    sleep 0.3 | echo -n "." 
    sleep 0.3 | echo -n "."
    sleep 0.3 | echo -n "."
    sleep 0.3 | echo -n "." 
    sleep 0.3 | echo -n "."
    sleep 0.3 | echo -n "." 
    sleep 0.3 | echo -n "50%"
    sleep 0.3 | echo -n "."
    sleep 0.3 | echo -n "." 
    sleep 0.3 | echo -n "." 
    sleep 0.3 | echo -n "." 
    sleep 0.3 | echo -n "." 
    sleep 0.3 | echo -n "."
    sleep 0.3 | echo -n "." 
    sleep 0.3 | echo -n "." 
    sleep 0.3 | echo -n "80%" 
    sleep 0.3 | echo -n "." 
    sleep 0.3 | echo -n "."
    sleep 0.3 | echo -n "."
    sleep 0.3 | echo -n "." 
    sleep 0.3 | echo -n "."
    sleep 0.3 | echo -n "."  
    sleep 0.3 | echo -n -e "${DGR}" "Done"
    echo ""
    echo -n -e "${GR}"
    sleep 0.5
    #input whois query into a variable
    nipeChkf=$(echo $(cd $(dirname $(locate nipe.pl)); sudo perl nipe.pl status | head -n2 | cut -d':' -f2 | cut -d ' ' -f2)) #input nipe's status check into a variable
    usrHost=$(echo $(cd $(dirname $(locate nipe.pl)); sudo perl nipe.pl status | tail -n2 | cut -d":" -f2 | cut -d" " -f2)) #Host IP Before change
    #Compare both variables. If Country is the same as the user original country AND nipe.pl is Disabled.
    if [[ "$usrNiped == $usrHost" ]] && [[ "$nipeChkf == 'disabled.'" ]]; then
        echo ""
        echo -e "${DGR}Your current IP Address is [${GR}"$usrHost"${DGR}]."
        echo -e "${DGR}[${GR}"Status: Exposed"${DGR}]"
        #In that case, script asks if user want to become anonymous in order to proceed.
        echo -n -e "${DGR}"
        echo ""
        read -p "Do you want to turn-on Incognito Mode? (y/n): " IncogChoic
        echo ""
        case $IncogChoic in
            [nN]* ) 
            echo -n -e "${DGR}"
            echo "Goodbye, then."
            sleep 0.3
            exit #If not, program exits while still not anonymous
            ;;
            [yY]* ) 
            clear
            echo -n "
            
            
            
"
            echo "Turning Incognito-Mode On"
            sleep 1.5
            if [[ "$usrNiped != $usrHost" ]] && [[ "$nipeChkf != 'disabled.'" ]]; then
                cd $(dirname $(locate nipe.pl))
                sudo perl nipe.pl start
                usrNiped=$(echo $(cd $(dirname $(locate nipe.pl)); sudo perl nipe.pl status | cut -d']' -f2 | tail -n2 | cut -d':' -f2 | cut -d ' ' -f2)) #Nipe using TOR's new IP.
                echo ""
                echo -e "${DGR}Your new IP Address changed to [${GR}"$usrNiped"${DGR}]."
                echo -n -e "${DGR}[${GR}"Status: Secured"${DGR}]"
                echo ""
                echo ""
                echo -n -e "${DGR}"
                echo "You may proceed."
                echo ""
            else
                usrNiped=$(echo $(cd $(dirname $(locate nipe.pl)); sudo perl nipe.pl status | cut -d']' -f2 | tail -n2 | cut -d':' -f2 | cut -d ' ' -f2)) #Nipe using TOR's new IP.
                echo ""
                echo -e "${DGR}Your new IP Address changed to [${GR}"$usrNiped"${DGR}]."
                echo -n -e "${DGR}[${GR}"Status: Secured"${DGR}]"
                echo ""
                echo ""
                echo -n -e "${DGR}"
                echo "You may proceed."
                echo ""
            fi
            cd ..
            ;; #if not, script stops nipe service and start again to continue.
            *)
            ANON
            ;;
        esac
    fi
VPSCNCT
}

function SCANCHK()
{
    clear
    read -p "Do you want to perform another scan? (y/n) " ScanChoic
    echo ""
    usrHost=$(echo $(cd $(dirname $(locate nipe.pl)); sudo perl nipe.pl status | tail -n2 | cut -d":" -f2 | cut -d" " -f2))
    usrChkNipe=$(echo $(cd $(dirname $(locate nipe.pl)); sudo perl nipe.pl status | cut -d"]" -f2 | head -n2 | cut -d":" -f2 | cut -d" " -f2))
#Function checks if user want to exit anonymity
case $ScanChoic in
    [nN]* ) 
    clear
    echo -n -e "${DGR}"
    echo -n "
    
    
    
"
    echo "Turning Incognito-Mode off and quit script."
    if [[  "$usrCHkNipe" == "disabled." ]]; then
        echo -e "${DGR}You are back in your original IP Address --- ${GR}"$usrHost"${DGR}."
        echo ""
        echo -e "Goodbye, ${GR}"$usrName"."
        #Back to original IP and exit program.
    else
        cd $(dirname $(locate nipe.pl));  sudo perl nipe.pl stop
        usrChkNipe=$(echo $(cd $(dirname $(locate nipe.pl)); sudo perl nipe.pl status | cut -d"]" -f2 | head -n2 | cut -d":" -f2 | cut -d" " -f2)) #New status check.
        echo -e "${DGR}You are back in your original IP Address --- ${GR}"$usrHost"${DGR}."
        echo ""
        echo -e "Goodbye, ${GR}"$usrName"."
    fi
    ;;
    [yY]* )
    echo -e "${DGR}Checking your anonymous status for a new scan."
    if [[ "$usrChkNipe" == "disabled." ]]; then
        cd $(dirname $(locate nipe.pl)); sudo perl nipe.pl start
        usrChkNipe=$(echo $(cd $(dirname $(locate nipe.pl)); sudo perl nipe.pl status | cut -d"]" -f2 | head -n2 | cut -d":" -f2 | cut -d" " -f2)) #New status check.
    fi
    sleep 1.5
    echo ""
    echo -e "${DGR}[{$GR}"Status: Secured"${DGR}]"
    echo ""
    VPSCNCT
    ;;
    *)
    SCANCHK
    ;; #No option is chosen, default if any other key pressed is to repeat function.
esac
}

function VPSCNCT()
{
#While under anonymity, checks for SSH input password (while password is invisible in screen input)
echo -n -e "${DGR}"
echo -n "




"
read -p "Please enter an SSH User name (Case-Sensitive): " sshUSR
read -p "Please enter an SSH Host IP Address (e.g: xxx.xxx.xxx.xxx): " sshIP
read -p "Please enter an SSH PORT (e.g: 22): " sshPORT
read -s -p "Please enter the password for the SSH user-name (Password keystrokes will be invisible): " sshPASS
echo ""
read -p "Please enter Target's IP Address for nmap scan and whois queries (e.g: 127.0.0.1): " sshTARGET
#Log in with password into 'input variables' of user, host, port and password.
#then script will execute nmap scans and whois queries of user's input target IP of choice.
clear
echo ""
echo -n -e "${GR}"
sshpass -p $sshPASS ssh -o StrictHostKeyChecking=no $sshUSR@$sshIP -p $sshPORT echo "WHOIS query for target IP --- $sshTARGET" ;echo "" ;echo -e "${DGR}" ;whois $sshTARGET | head -n 56 | tail -n 46 ;echo "" ;echo "NMAP scan for $sshTARGET Address." ;echo "(Press any key to check scan status. It might take a white...)" ;echo "" ;echo -e "${DGR}" ;nmap -Pn -sC $sshTARGET
echo -n -e "${DGR}"
echo ""
read -n 1 -s -r -p "Press any key to clear the scans." key
#Return to check if user wants to stay anonymous or exit script
SCANCHK
}

START