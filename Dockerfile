FROM haskell:latest

RUN echo "Verificando versión de compialdor ghc"
RUN ghc --version && cabal --version && stack --version

RUN echo "Actualizando e Instalando entr"
RUN apt-get update && apt-get install -y entr

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia tu archivo Haskell al contenedor (se asegura de que no haya conflictos)
COPY *.hs /app/

COPY *.txt /app/