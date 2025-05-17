
# Comandos

## Crear ambiente de desarrollo

1. Se crea la imagen. **Si ya está creada, sigue al siguiente paso.**
```
docker build -t haskell-environment .
```

2. Crear una instancia del contenedor con terminal bash. **Si ya tienes una instancia creada, sigue el paso 2.1**
```
docker run --name haskell_container -it -v "$(pwd):/app" haskell-environment bash
```

2. 1. Si ya tienes un contenedor creado puedes levantarlo con el siguiente comando:
```
docker start haskell_container
```

3. Una vez instanciado el contenedor, puedes entrar a ella con el siguiente comando
```
docker exec -it haskell_container bash
```

4. Ejecutar entr para compilación automática
Este comando se ejecuta dentro del contenedor para lanzar la herramienta entr que monitorea los cambios del archivo especificado. **OJO: este comando queda ejecutandose en la terminal. Para ejecutar ejemplo.hs se debe abrir otra terminal hacia el docker y luego buscar el archivo**

Dentro del contenedor:
```
ls /app/*.hs | entr ghc -o ejemplo /app/ejemplo.hs
```

## Ejecutar el archivo de ejemplo

1. Entrar a instancia de contenedor

Para ejecutar el archivo de ejemplo de Haskell debe entrar nuevamente al contenedor en la consola bash, por tanto abra una nueva terminal y ejecute:
```
docker exec -it haskell_container bash
```

2. Ejecutar el archivo de ejemplo

Dentro de ese contenedor puede ejecutar el archivo de ejemplo de Haskell abriendo la terminal de ghci con el siguiente comando:
```
ghci ejemplo
```

o ejecutar una vez el archivo de ejemplo de Haskell con el siguiente comando:
```
./ejemplo
```