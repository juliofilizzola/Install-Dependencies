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

echo "Instalação finalizada!"
echo "Ferramentas instaladas:"
echo "- NVM (Node Version Manager)"
