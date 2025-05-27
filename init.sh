#!/bin/bash
set -e

echo "Ejecutando app dentro de contenedor"
docker exec -it haskell_container ./app

