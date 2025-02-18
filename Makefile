# Nome do script
SCRIPT = install_dependencies.sh
SCRIPT_2 = Install_dev.sh
UPDATE_SCRIPT = update_dependencies.sh

#
.PHONY: all
all: install

# Alvo para executar o script de instalação
.PHONY: install
install: $(SCRIPT)
	@echo "Executando o script de instalação..."
	@chmod +x $(SCRIPT)
	@./Shell/$(SCRIPT)

INSTALL_DEV: $(SCRIPT_2)
	@echo "Executando o script de instalação..."
	@chmod +x $(SCRIPT_2)
	@./Shell/$(SCRIPT_2)


# Alvo para limpar permissões do script (opcional)
.PHONY: clean
clean:
	@echo "Removendo permissões executáveis do script..."
	@chmod -x ./Shell/$(SCRIPT)

clean_dev:
	@echo "Removendo permissões executáveis do script..."
	@chmod -x ./Shell/$(SCRIPT_2)

update:
	@echo "Update..."
	@chmod +x (UPDATE_SCRIPT)
	@./Shell/(UPDATE_SCRIPT)

# Alvo de ajuda
.PHONY: help
help:
	@echo "Comandos disponíveis:"
	@echo "  make install   	- Executa o script de instalação"
	@echo "  make clean     	- Remove permissões executáveis do script"
	@echo "  ----------------------------------------------------- "
	@echo "  make install_dev      - Executa o script de instalação dev"
	@echo "  make clean_dev     	- Remove permissões executáveis do script dev"
	@echo "  make help      	- Exibe esta mensagem de ajuda"
