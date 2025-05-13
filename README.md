
# Comandos

## Crear ambiente

Se crea la imagen
```
docker build haskell-environment .
```

Ingresar al contenedor en terminal bash
```
docker run --name haskell_container -it -v "$(pwd):/app" haskell-environment bash
```


Este comando se ejecuta dentro del contenedor para lanzar la herramienta entr que monitorea los cambios del archivo especificado. **OJO: este comando queda ejecutandose en la terminal. Para ejecutar ejemplo.hs se debe abrir otra terminal hacia el docker y luego buscar el archivo**

```
ls /app/*.hs | entr ghc -o ejemplo /app/ejemplo.hs
```

Para ejecutar el archivo de ejemplo de Haskell debe entrar nuevamente al contenedor en la consola bash, por tanto abra una nueva terminal y ejecute:
```
docker exec -it haskell_container bash
```

## Ejecutar el archivo de ejemplo

Dentro de ese contenedor puede ejecutar el archivo de ejemplo de Haskell abriendo la terminal de ghci con el siguiente comando:
```
ghci ejemplo
```

o ejecutar una vez el archivo de ejemplo de Haskell con el siguiente comando:
```
./ejemplo
```