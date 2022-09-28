#！/bin/bash

//.profile change ------------------------------------------------------------------------------------------------------------------------
echo 'export PATH=/usr/loca/sbin:/usr/sbin:/sbin:$PATH:' >> /root/.profile
source /root/.profile
echo 'export PATH=/usr/loca/sbin:/usr/sbin:/sbin:$PATH:' >> /home/lingxi/.profile && source  /home/lingxi/.profile

//.bashrc change -------------------------------------------------------------------------------------------------------------------------
echo "#root.bashrc conf 
  alias ls='ls --color'
  alias ls='ls $LS_OPTIONS'
  alias ll='ls $LS_OPTIONS -l'
  alias l='ls $LS_OPTIONS -lA'
  alias rm='rm -i'
  alias cp='cp -i'
  alias mv='mv -i'" >> /root/.bashrc



  echo "#lingxi.bashrc conf 
  alias ls='ls --color'
  alias ls='ls $LS_OPTIONS'
  alias ll='ls $LS_OPTIONS -l'
  alias l='ls $LS_OPTIONS -lA'
  alias rm='rm -i'
  alias cp='cp -i'
  alias mv='mv -i'" >> /home/lingxi/.bashrc


//change image sources.list --------------------------------------------------------------------------------------------------------------
mv /etc/apt/sources.list /etc/apt/sources.list.bak
touch /etc/apt/sources.list

echo "
    # aliyunsource----------------------------
    deb https://mirrors.aliyun.com/debian/ bullseye main non-free contrib 
    deb-src https://mirrors.aliyun.com/debian/ bullseye main non-free contrib 
    deb https://mirrors.aliyun.com/debian-security/ bullseye-security main 
    deb-src https://mirrors.aliyun.com/debian-security/ bullseye-security main 
    deb https://mirrors.aliyun.com/debian/ bullseye-updates main non-free contrib 
    deb-src https://mirrors.aliyun.com/debian/ bullseye-updates main non-free contrib 
    deb https://mirrors.aliyun.com/debian/ bullseye-backports main non-free contrib 
    deb-src https://mirrors.aliyun.com/debian/ bullseye-backports main non-free contrib" >> /etc/apt/sources.list
    apt update -y && apt install apt upgrade -y 

source /root/.bashrc && source /home/lingxi/.bashrc

//change ssh_config ----------------------------------------------------------------------------------------------------------------------
echo "
    PermitRootLogin yes
    PasswordAuthentication yes" >> /etc/ssh/sshd_config && /etc/init.d/ssh restart



//install package -------------------------------------------------------------------------------------------------------------------------
apt install sshfs -y && apt install cifs-utils -y && apt install vim -y

