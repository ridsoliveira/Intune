#!/bin/bash

# Verificar se o Microsoft Edge já está instalado
if ! command -v msedge &> /dev/null; then
  # Instalação do Microsoft Edge

  # Verificar a versão do Ubuntu
  ubuntu_version=$(lsb_release -r -s)

  # Baixar o pacote DEB do Microsoft Edge
  if [[ $ubuntu_version == "20.04" ]]; then
    wget "https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-dev/microsoft-edge-dev_93.0.946.0-1_amd64.deb" -O edge.deb
  elif [[ $ubuntu_version == "22.04" ]]; then
    wget "https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-dev/microsoft-edge-dev_93.0.946.0-1_amd64.deb" -O edge.deb
  else
    echo "Versão do Ubuntu não suportada."
    exit 1
  fi

  # Instalar o pacote DEB do Microsoft Edge
  sudo dpkg -i edge.deb
  sudo apt install -f -y

  # Remover o pacote DEB do Microsoft Edge
  rm edge.deb
else
  echo "Microsoft Edge já está instalado."
fi

# Verificar a versão do Ubuntu
ubuntu_version=$(lsb_release -r -s)

if [[ $ubuntu_version == "20.04" ]]; then
  # Instalação para Ubuntu 20.04

  # Instalar Curl
  sudo apt install curl gpg -y

  # Instalar chave de assinatura do pacote Microsoft
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  sudo install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/
  sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/ubuntu/20.04/prod focal main" > /etc/apt/sources.list.d/microsoft-ubuntu-focal-prod.list'
  sudo rm microsoft.gpg

  # Instalar o aplicativo Microsoft Intune
  sudo apt update
  sudo apt install intune-portal -y
elif [[ $ubuntu_version == "22.04" ]]; then
  # Instalação para Ubuntu 22.04

  # Instalar Curl
  sudo apt install curl gpg -y

  # Instalar chave de assinatura do pacote Microsoft
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  sudo install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/
  sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/ubuntu/22.04/prod jammy main" > /etc/apt/sources.list.d/microsoft-ubuntu-jammy-prod.list'
  sudo rm microsoft.gpg

  # Instalar o aplicativo Microsoft Intune
  sudo apt update
  sudo apt install intune-portal -y
else
  echo "Versão do Ubuntu não suportada."
  exit 1
fi

# Reinicialize o dispositivo
sudo reboot
