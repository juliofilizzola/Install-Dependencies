#!/bin/bash

# Script para atualizar o Docker Desktop no Ubuntu

# Verificar a versão atual do Docker
echo "Verificando a versão atual do Docker..."
docker --version

# Baixar a nova versão do Docker Desktop
echo "Acesse o site oficial do Docker para baixar a versão mais recente:"
echo "https://www.docker.com/products/docker-desktop"
read -p "Após baixar o arquivo .deb, insira o caminho completo do arquivo: " docker_deb_path

# Verificar se o arquivo .deb existe
if [ ! -f "$docker_deb_path" ]; then
  echo "Arquivo .deb não encontrado. Verifique o caminho e tente novamente."
  exit 1
fi

# Remover a versão antiga (opcional)
echo "Removendo a versão antiga do Docker Desktop..."
sudo apt-get remove -y docker-desktop

# Instalar a nova versão
echo "Instalando a nova versão do Docker Desktop..."
sudo apt-get install -y "$docker_deb_path"

# Iniciar o Docker Desktop
echo "Iniciando o Docker Desktop..."
systemctl --user start docker-desktop

# Verificar a instalação
echo "Verificando a instalação..."
docker --version
docker ps

# Atualizar o Docker Compose (opcional)
echo "Atualizando o Docker Compose..."
sudo apt-get update
sudo apt-get install -y docker-compose-plugin
docker compose version

# Limpeza (opcional)
echo "Realizando limpeza de pacotes desnecessários..."
sudo apt-get autoremove -y
sudo apt-get autoclean -y

echo "Atualização do Docker Desktop concluída com sucesso!"
