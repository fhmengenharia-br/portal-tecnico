#!/usr/bin/env bash

set -e

echo
echo "=========================================="
echo " Publicação do Portal FHM Engenharia"
echo "=========================================="
echo

# Confirma que o script está dentro de um repositório Git
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "ERRO: esta pasta não é um repositório Git."
  exit 1
fi

# Verifica se existem alterações
if git diff --quiet && git diff --cached --quiet; then
  echo "Não existem alterações para publicar."
  exit 0
fi

echo "Arquivos alterados:"
git status --short
echo

read -r -p "Digite a descrição da atualização: " mensagem

if [ -z "$mensagem" ]; then
  echo "ERRO: a mensagem do commit não pode ficar vazia."
  exit 1
fi

echo
echo "Adicionando os arquivos..."
git add .

echo
echo "Criando o commit..."
git commit -m "$mensagem"

echo
echo "Enviando para o GitHub..."
git push

echo
echo "=========================================="
echo " Envio concluído com sucesso"
echo "=========================================="
echo
echo "Último commit:"
git log -1 --oneline
echo
echo "O Cloudflare Pages deverá iniciar agora"
echo "o processo automático de publicação."
