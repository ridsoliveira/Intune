#!/bin/bash

# Verificar se o Microsoft Edge já está instalado
if ! command -v msedge &> /dev/null; then
  # Instalação do Microsoft Edge
  echo "Instalação do Microsoft Edge. Aguarde..."
  sleep 3

  # Verificar a versão do Ubuntu
  ubuntu_version=$(lsb_release -r -s)

  # Baixar o pacote DEB do Microsoft Edge
  if [[ $ubuntu_version == "20.04" || $ubuntu_version == "22.04" ]]; then
    ## Setup
    # Instalar chave de assinatura do pacote Microsoft
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-beta.list'
    sudo rm microsoft.gpg
    ## Install
    sudo apt update
    sudo apt install microsoft-edge-beta -y
  else
    echo "Versão do Ubuntu não suportada."
    exit 1
  fi

  # Remover o pacote DEB do Microsoft Edge
  rm microsoft-edge-beta.list
else
  echo "Microsoft Edge já está instalado."
  sleep 5
fi

# Instalação do aplicativo Microsoft Intune para Ubuntu 20.04
if [[ $ubuntu_version == "20.04" || $ubuntu_version == "22.04" ]]; then
  echo "Instalar o aplicativo Microsoft Intune. Aguarde..."
  sleep 3
  sudo apt update
  sudo apt install intune-portal -y
else
  echo "Versão do Ubuntu não suportada."
  exit 1
fi

# Reinicializar o dispositivo
echo "Reinicializando o dispositivo em 30 segundos. Aguarde..."
sleep 3
sudo reboot
