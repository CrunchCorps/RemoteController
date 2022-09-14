
<p align="center">
  <img src="https://github.com/CrunchCorps/RemoteController/blob/main/logobakeneko.png">
  <p align="center">Bash script that conducts scans on a target IP while logging anonymously into a secure virtual server.</p>
  <p align="center">
  </a>
    <a href="https://github.com/CrunchCorps/RemoteController">
      <img src="https://img.shields.io/badge/Version-2.4.6-darkgreen">
        <img src="https://img.shields.io/badge/Release%20Date-September%202022-blue">
  <img src="https://shields.io/badge/Bash-100%25-066da5">
  <img src="https://shields.io/badge/Platform-Linux-darkred">
    </a>
  </p>
</p>

# RemoteController #
A script coded in bash, designed to create an anonymous environment to log into a secure virtual server and conduct scans on a target IP address.

### Using this script will allow you to: ###

Installing required dependencies in-script:

      > The required dependencies and libraries will be scanned and any missing packges will be installed automatically.

Secure your logging identify using the power of TOR servers:
  
      > The script will use the Nipe and CPAN engines to connect through TOR.
  
Logging into a secure server will be using SSH and SSHPASS:
  
      > User will be prompt to enter an IP, username and (hidden) password for his specified connection.
      
Scanning Target IP using WHOIS and NMAP:

      > While connecting though SSH, User will enter a Target IP which will be scanned in a secure environment.
  
IP address will return to its initial state and disconnect from the SSH connection and from TOR servers:

      > User will be prompt to choose to do another scan while still connected or exit the script, and return to his initial state of network.
      
---
  
### Using RemoteController ###
    
Download the [zip](../../main.zip)

  or

Clone the repository:

      > git clone https://github.com/CrunchCorps/RemoteController.git

Running the script [require SUDO privilges]:
  
      > sudo bash RemoteController.sh

---
  
### Dependencies ###
  
      > Will be installed automatically in-script.
   
### License ###

      > [GNU General Public License v3.0] (https://www.gnu.org/licenses/why-not-lgpl.html)
