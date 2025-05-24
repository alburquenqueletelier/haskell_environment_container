#!/bin/bash
set -e

echo "Instalando ambiente Haskell"

if docker image ls | grep -q "^haskell"; then
    echo "Imagen docker ya existe"
else
    docker build -t haskell-environment .
    echo "Imagen docker creada"
fi

echo "Instanciando contenedor"

if docker ps -a --format '{{.Names}}' | grep -q "^haskell_container$"; then
    echo "Ya existe el contenedor. Iniciando..."
    docker start haskell_container
else
    echo "No existe el contendor. Creando..."
    docker run -d --name haskell_container -v "$(pwd):/app" haskell-environment tail -f /dev/null
fi

echo "Iniciando entr para compilar el proyecto"

echo "Compilando una vez para generar el binario inicial…"
docker exec haskell_container ghc -o /app/app -odir /app/.build -hidir /app/.build -i. App.hs
echo "Arrancando compilador automático. Esto bloquea la terminal..."

docker exec -it haskell_container bash -c \
  'cd /app && ls *.hs Utils/*.hs | entr -r ghc -o app -odir .build -hidir .build -i. App.hs'