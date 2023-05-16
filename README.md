# Intune
Scripts para automatizar rotinas de manutenção de dispositivos Linux/Ubuntu no Intune

## Pré-requisitos
- Distribuições baseadas em Debian/Ubuntu versão 20 ou 22
- Git instalado. Caso você não tenha, realize a instalação do Git com o seguinte comando no terminal:
```sudo apt-get install git```



Para executar qualquer script corretamente, siga as etapas abaixo:
1. **Clonando o Repositório** - Abrir o terminal e navegue até o diretório onde deseja clonar o repositório. Em seguida, execute o seguinte comando:<br>
```git clone https://github.com/ridsoliveira/Intune.git```
- Esse comando vai criar um novo diretório chamado "Intune", que contém todo o conteúdo do repositório.
2. **Navegar até o Diretório do Repositório** - Usando o comando cd: ```cd Intune```
3. Executar o Script desejado com os comandos:
```chmod +x Nome_Do_Script.sh```
```./Nome_Do_Script.sh```


## Registrar dispositivo Linux no Intune (Edge_Intune_install_script.sh)
O registro no Intune é manual. O script **Edge_Intune_install_script.sh** vai lhe ajudar no processo de instalação do App do Intune e do Microsoft Edge qué pré-requisitos para registrar seu dispositivo no Intune. Esse script verifica se o Microsoft Edge e o App do Intune foi instalado no seu dispositivo, se não estiver instalar faz a instalação.

1. Clonando o Repositório - Abrir o terminal e navegue até o diretório onde deseja clonar o repositório. Em seguida, execute o seguinte comando:<br>
```git clone https://github.com/ridsoliveira/Intune.git```
  - Esse comando vai criar um novo diretório chamado "Intune", que contém todo o conteúdo do repositório.
2. Navegar até o Diretório do Repositório - Usando o comando cd: ```cd Intune```
3. Executar o script intune_install_script.sh com os comandos:
```sudo chmod +x intune_install_script.sh```
```sudo bash intune_install_script.sh```

## Instalar o Microsoft Teams Web (teams-webapp.desktop)
Até a data de elaboração deste documento, a Microsoft não disponibilizou uma versão do Teams para Linux. Como solução de contorno, foi criado um arquivo .desktop (teams-webapp.desktop) para representar o aplicativo do Teams, que aponta para a versão web do Teams. Esta abordagem facilita o acesso ao Teams Web, e os usuários terão a sensação de estar acessando o aplicativo do Teams instalado.

Para executar o teams-webapp.desktop corretamente, siga as etapas abaixo:
1. Clonando o Repositório - Abrir o terminal e navegue até o diretório onde deseja clonar o repositório. Em seguida, execute o seguinte comando:<br>
```git clone https://github.com/ridsoliveira/Intune.git```
  - Esse comando vai criar um novo diretório chamado "Intune", que contém todo o conteúdo do repositório.
2. Navegar até o Diretório do Repositório - Usando o comando cd: ```cd Intune```
3. Executar o script teams-webapp.desktop com os comandos:
```sudo cp teams-webapp.desktop /usr/share/applications```
```sudo chmod +x /usr/share/applications/teams-webapp.desktop```
```sudo bash intune_install_script.sh```
4. Você pode abrir o "Teams Web App" no menu de aplicativos

Você pode utilizar os navegadores Chrome ou o Microsoft Edge. Se quiser usar o Chromium, deve alterar no teams-webapp.desktop o caminho para: /usr/bin/chromium-browser 
Se for usar o Microsoft Edge, alterar para: /usr/bin/microsoft-edge.






*Certifique-se de executar os comandos acima na ordem correta e verificar se você tem as permissões necessárias para executá-los.
