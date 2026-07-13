#!/bin/bash

echo "=============================================="
echo " Portal Técnico - FHM Engenharia"
echo "=============================================="
echo

# Verifica se o package.json existe
if [ ! -f "package.json" ]; then
    echo "ERRO: Execute este script na pasta raiz do projeto."
    exit 1
fi

echo "Iniciando servidor Eleventy..."
echo

npx @11ty/eleventy --serve
