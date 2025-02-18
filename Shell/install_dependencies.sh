#!/bin/bash

echo "Atualizando pacotes do sistema..."
sudo apt update && sudo apt upgrade -y

# Instalar Git
echo "Instalando Git..."
sudo apt install -y git

# Instalar JetBrains Toolbox
echo "Instalando JetBrains Toolbox..."
JETBRAINS_URL="https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.28.1.15219.tar.gz"
wget -O jetbrains-toolbox.tar.gz $JETBRAINS_URL
tar -xvzf jetbrains-toolbox.tar.gz -C /tmp
sudo mv /tmp/jetbrains-toolbox-*/jetbrains-toolbox /usr/local/bin/
rm -rf jetbrains-toolbox.tar.gz /tmp/jetbrains-toolbox-*

# Instalar Visual Studio Code
echo "Instalando Visual Studio Code..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install -y code

# Limpeza
echo "Limpando pacotes desnecessários..."
sudo apt autoremove -y
sudo apt autoclean -y

echo "Instalação concluída!"
