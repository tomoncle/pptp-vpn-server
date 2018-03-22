#! /bin/bash

#########
# os: ubuntu
# tomoncle


function install_pptp { 
  sudo apt-get update
  sudo apt-get install pptpd
}

function config_kernel_IP_forwarding {
  sudo sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
  sudo sysctl -p
}

function config_pptp {
  sudo sed -i 's/#localip 192.168.0.1/localip 192.168.0.1/g' /etc/pptpd.conf
  sudo sed -i 's/#remoteip 192.168.0.234-238,192.168.0.245/remoteip 192.168.0.234-238,192.168.0.245/g' /etc/pptpd.conf 
  sudo sed -i 's/#ms-dns 10.0.0.1/ms-dns 8.8.8.8/g' /etc/ppp/pptpd-options
  sudo sed -i 's/#ms-dns 10.0.0.2/ms-dns 8.8.4.4/g' /etc/ppp/pptpd-options
  sudo echo "$username  pptpd  \"$password\"  *" >> /etc/ppp/chap-secrets
}

function iptables_config {
  sudo apt-get install iptables
  sudo iptables -F
  sudo iptables -X
  sudo iptables -t nat -F
  sudo iptables -t nat -X
  sudo iptables -A INPUT -p gre -j ACCEPT
  sudo iptables -A INPUT -p tcp --dport 1723 -j ACCEPT 
  sudo iptables -A INPUT -p tcp --dport 47 -j ACCEPT 
  sudo iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o eth0 -j MASQUERADE
}


# start shell.
echo 'Please enter the VPN connection username:'
read username
echo 'Please enter the VPN connection password:'
read password

install_pptp
config_kernel_IP_forwarding
iptables_config
config_pptp
sudo service pptpd restart

echo -e "\npptp vpn service config success!!!"
