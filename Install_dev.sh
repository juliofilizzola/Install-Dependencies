#!/bin/bash

set -e # Para o script parar em caso de erro

echo "Iniciando instalação das ferramentas no Ubuntu..."

# Atualizando pacotes
echo "Atualizando pacotes..."
sudo apt update -y && sudo apt upgrade -y

# Instalando o NVM
echo "Instalando NVM..."
if [[ ! -d "$HOME/.nvm" ]]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  echo "NVM instalado com sucesso. Use 'nvm install node' para instalar o Node.js."
else
  echo "NVM já está instalado."
fi

# Instalando Docker
echo "Instalando Docker..."
if ! command -v docker &>/dev/null; then
  sudo apt install -y ca-certificates curl gnupg
  sudo install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
  sudo apt update -y
  sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  sudo usermod -aG docker $USER
  echo "Docker instalado com sucesso. Você precisa fazer logout/login para usar o Docker sem sudo."
else
  echo "Docker já está instalado."
fi

# Instalando Docker Compose (caso não esteja incluído)
echo "Instalando Docker Compose..."
if ! command -v docker-compose &>/dev/null; then
  sudo curl -L "https://github.com/docker/compose/releases/download/v2.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  echo "Docker Compose instalado com sucesso."
else
  echo "Docker Compose já está instalado."
fi

# Instalando Vim
echo "Instalando Vim..."
sudo apt install -y vim

# Instalando Postman
echo "Instalando Postman..."
if ! command -v snap &>/dev/null; then
  echo "Snap não encontrado. Instalando o Snap..."
  sudo apt install -y snapd
fi
sudo snap install postman

echo "Instalação finalizada!"
echo "Ferramentas instaladas:"
echo "- NVM (Node Version Manager)"
echo "- Docker"
echo "- Docker Compose"
echo "- Vim"
echo "- Postman"
