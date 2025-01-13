# Script de Instalação de Ferramentas Essenciais

Este repositório contém um script Bash para automatizar a atualização do sistema e a instalação de diversas ferramentas essenciais para desenvolvedores.

## Ferramentas Instaladas

O script instala as seguintes ferramentas:

- **Git**: Sistema de controle de versão distribuído.
- **JetBrains Toolbox**: Gerenciador de IDEs JetBrains.
- **Docker**: Plataforma de conteinerização.
- **Visual Studio Code**: Editor de código leve e versátil.
- **Vim**: Editor de texto em terminal.

## Requisitos

- Distribuição baseada em Debian (ex.: Ubuntu).
- Permissões de administrador (sudo).

## Como Usar

1. Clone este repositório ou baixe o arquivo `install_tools.sh`.

   ```bash
   git clone git@github.com:juliofilizzola/Install-Dependencies.git
   cd Install-Dependencies
   ```

2. Torne o arquivo executável:

   ```bash
   chmod +x install_dependencies.sh
   ```

3. Execute o script com permissão de administrador:

   ```bash
   sudo ./install_dependencies.sh
   ```

4. Aguarde a conclusão da instalação.

## O que o script faz

- **Atualiza o sistema**: Usa `apt update` e `apt upgrade` para garantir que você tenha os pacotes mais recentes.
- **Instala as ferramentas mencionadas**: Realiza downloads, configura repositórios e instalações de maneira automatizada.
- **Remove pacotes desnecessários**: Realiza limpeza de arquivos e pacotes não utilizados.

## Notas

- Para o **JetBrains Toolbox**, certifique-se de que a URL no script é a mais atual. Você pode verificar no [site oficial](https://www.jetbrains.com/toolbox-app/).
- O script é projetado para sistemas baseados em Debian. Para outras distribuições Linux, como Fedora ou Arch, ajustes serão necessários.

## Adicionando mais ferramentas

Caso deseje incluir novas ferramentas, basta adicionar os comandos de instalação no script. Siga o mesmo padrão usado para as ferramentas já listadas.

## Licença

Este projeto está licenciado sob a [Licença MIT](LICENSE). Sinta-se à vontade para usar e modificar conforme necessário.
