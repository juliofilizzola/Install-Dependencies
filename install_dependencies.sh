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

# Instalar Docker
echo "Instalando Docker..."
sudo apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Instalar Spotify
echo "Instalando Spotify..."
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo gpg --dearmor -o /usr/share/keyrings/spotify-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/spotify-archive-keyring.gpg] http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install -y spotify-client

# Instalar Visual Studio Code
echo "Instalando Visual Studio Code..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install -y code

# Instalar Vim
echo "Instalando Vim..."
sudo apt install -y vim

# Instalar Warp
echo "Instalando Warp..."
WARP_URL="https://warp-terminal.com/download/linux-deb"
wget -O warp.deb $WARP_URL
sudo apt install -y ./warp.deb
rm warp.deb

# Instalar Postman
echo "Instalando Postman..."
sudo snap install postman

# Limpeza
echo "Limpando pacotes desnecessários..."
sudo apt autoremove -y
sudo apt autoclean -y

echo "Instalação concluída!"
