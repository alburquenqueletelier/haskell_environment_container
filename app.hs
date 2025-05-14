import System.IO

## define estructura string
type Tablero = [[Char]]

main :: IO ()
main = do
    contenido <- readFile "input.txt"
    let tablero = lines contenido  -- NO eliminamos espacios, cada línea debe tener exactamente 3 caracteres
    print tablero