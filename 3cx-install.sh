#!/bin/bash

if [ "$OSTYPE" == "linux-gnu" ]
then
  echo "Type d'os Valide."
else
  exit
fi

# Function d'installation de 3cx
install3cx()
{
  apt install wget -y
  wget -O- http://downloads-global.3cx.com/downloads/3cxpbx/public.key | apt-key add -
  echo "deb http://downloads-global.3cx.com/downloads/debian $1 main" | tee /etc/apt/sources.list.d/3cxpbx.list
  apt update -y && apt install net-tools -y
  apt install 3cxpbx
}

cat /etc/os-release | grep -i "jessie"
if [ $? -eq 0 ]
then
  osrelease="jessie"
  install3cx "$osrelease"
fi

cat /etc/os-release | grep -i "stretch"
if [ $? -eq 0 ]
then
  osrelease="stretch"
  install3cx "$osrelease"
fi
