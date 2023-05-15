#!/bin/bash
# ATENÇÃO! Esse sscript ainda está em desenvolvimento e testes. 

# Vai adicionar o repositório do MS Teams
curl https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list'

# Atualizar a lista de pacotes
sudo apt update

# Instalar o Microsoft Teams
sudo apt install teams

# Remover o arquivo temporário do GPG
rm microsoft.gpg
