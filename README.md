# Ambiente para desarrollar con Haskell

Entorno Docker reproducible para compilar, ejecutar y recargar proyectos Haskell mediante **GHC + entr**.

## Tabla de contenidos

- [Ambiente para desarrollar con Haskell](#ambiente-para-desarrollar-con-haskell)
  - [Tabla de contenidos](#tabla-de-contenidos)
  - [Requerimientos](#requerimientos)
  - [Instalación](#instalación)
    - [Qué hace `setup.sh`](#qué-hace-setupsh)
  - [Uso rápido](#uso-rápido)
  - [Estructura del proyecto](#estructura-del-proyecto)
  - [Variables de entorno](#variables-de-entorno)
  - [Tareas frecuentes](#tareas-frecuentes)
  - [Problemas conocidos](#problemas-conocidos)
  - [Contribuir](#contribuir)
  - [Licencia](#licencia)
  - [Autor](#autor)

---

## Requerimientos

| Software | Versión mínima | Cómo verificar     |
| -------- | -------------- | ------------------ |
| Docker   | **28.0.0**     | `docker --version` |
| Git      | 2.30           | `git --version`    |

> **Nota:** En Windows se recomienda WSL 2; en macOS, Docker Desktop >= 28.0

## Instalación

```bash
git clone https://github.com/alburquenqueletelier/haskell_environment_container.git
cd haskell_environment_container
./setup.sh      # construye la imagen y el contenedor `haskell_container`
```

**Nota:** si `./setup.sh` falla haz click [aquí para ver como solucionarlo](##problemas-conocidos)

> La primera vez tarda unos minutos (descarga de imagen + compilación).

### Qué hace `setup.sh`

1. Construye la imagen **haskell-environment** (basada en `haskell:latest`).
2. Crea/inicia el contenedor **haskell\_container** montando el repo en `/app`.
3. Compila `app.hs` → binario `/app/app`.
4. Arranca **entr** en 1er plano para recompilar al guardar cambios.

## Uso rápido

En **terminal 1** (ya bloqueada por `setup.sh`) se ve el log de recompilación.
En **terminal 2**:

```bash
bash init.sh      # ejecuta /app/app dentro del contenedor
```

Guarda tu `.hs`; entr lo recompila automáticamente.  Vuelve a ejecutar `bash init.sh` para probar.

## Estructura del proyecto

```
.
├─ app.hs           # Programa principal
├─ Dockerfile
├─ setup.sh
├─ init.sh
├─ *.txt            # Archivos de entrada de ejemplo
└─ README.md
```

* **Dockerfile**: imagen con GHC, Cabal, Stack y entr.
* **setup.sh**: prepara todo el entorno.
* **init.sh**: corre el binario interactivo cada vez que quieras probar.

## Variables de entorno

| Variable    | Descripción                       | Valor por defecto |
| ----------- | --------------------------------- | ----------------- |
| `GHC_FLAGS` | Flags adicionales pasados a `ghc` | `-Wall -O0`       |
| `APP_ENTRY` | Ruta del archivo principal        | `app.hs`          |

Puedes exportarlas antes de ejecutar `setup.sh`, p. ej.:

```bash
export APP_ENTRY=Main.hs
bash setup.sh
```

## Tareas frecuentes

| Tarea                              | Comando                                                            |
| ---------------------------------- | ------------------------------------------------------------------ |
| Forzar reconstrucción de la imagen | `docker build --no-cache -t haskell-environment .`                 |
| Abrir shell en el contenedor       | `docker exec -it haskell_container bash`                           |
| Ver logs de entr                   | `docker exec -it haskell_container tail -f /app/entr.log`          |
| Detener contenedor                 | `docker stop haskell_container`                                    |
| Borrar contenedor + imagen         | `docker rm -f haskell_container && docker rmi haskell-environment` |

## Problemas conocidos

| Síntoma                     | Causa / Solución                                                                                                                              |
| --------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| `entr: orden no encontrada` | El paquete no se instaló: reconstruye la imagen (`docker build …`).                                                                           |
| Cambios no recompilan       | Asegúrate de editar archivos dentro del repo montado (`$(pwd)`); verifica que entr liste el archivo con `ls /app/*.hs` dentro del contenedor. |
| `hGetLine: end of file`     | Ejecutaste el binario sin TTY (`-it`); usa `bash init.sh`.                                                                                    |
| `Permiso denegado`          | El archivo no tiene permisos de ejecución; usa `chmod +x nombre_archivo.sh`. Si el error persiste, prueba con `bash nombre_archivo.sh`                                                                      |

## Contribuir

1. Crea una *issue* describiendo la mejora o el bug.
2. Haz *fork*, crea una rama `git checkout -b feature/nombre`.
3. *Commits* atómicos y mensaje en español o inglés, imperativo.
4. Pull request con descripción clara y **screenshots/logs** si aplica.

Se aplica la guía de estilo [`CONTRIBUTING.md`](CONTRIBUTING.md) (pendiente).

## Licencia

Este proyecto está bajo la licencia MIT.  Consulta el archivo [`LICENSE`](LICENSE).

## Autor

Bryan — [@alburquenqueletelier](https://github.com/alburquenqueletelier)
¡Sugerencias y *pull requests* son bienvenidos!

---