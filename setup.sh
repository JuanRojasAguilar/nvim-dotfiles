#!/bin/bash

CONFIG_REPO="https://github.com/JuanRojasAguilar/nvim-dotfiles"
NVIM_DIR="$HOME/.config/nvim"

echo "Instalando Nvim..."

if ! command -v git &> /dev/null; then
    echo "No tienes instalado Git"
    exit 1
fi

if [ -d "$NVIM_DIR/.git" ]; then
    echo "Actualizando..."
    git -C "$NVIM_DIR" pull
elif [ -d "$NVIM_DIR" ]; then
    echo "Limpiando e instalando..."
    rm -rf "$NVIM_DIR"
    git clone "$CONFIG_REPO" "$NVIM_DIR"
else
    echo "Instalacion limpia"
    git clone "$CONFIG_REPO" "$NVIM_DIR"
fi

if [ $? -eq 0 ]; then
    echo "Configuracion lista en $NVIM_DIR"
else
    echo "Error clonando el repositorio"
    exit 1
fi

echo "Todo parece haber salido bien, abre nvim"
