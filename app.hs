import System.IO

-- define estructura string
type Tablero = [[Char]]

prueba = print("Hola Programador")
prueba2 = "hola hola"
minimo = min 3 2
suma a b = a + b

parImpar x = if x `mod` 2 == 0 then "par" else "impar"

main :: IO ()
main = do
    putStrLn "¡Hola Mundo desde Haskell!"
    putStrLn "¿Cómo te llamas?"
    nombre <- getLine
    putStrLn ("Hola, " ++ nombre ++ "!")

    putStrLn ("Ingresa primer num")
    a <- getLine
    putStrLn ("Ingresa segundo num")
    b <- getLine

    -- funcion suma (falta completar)
    putStrLn("La suma es: " )

    putStrLn ("a = " ++ a)
    putStrLn ("b = " ++ b)

    -- lectura de contenido de archivo
    contenido <- readFile "input.txt"
    let tablero = lines contenido  -- NO eliminamos espacios, cada línea debe tener exactamente 3 caracteres
    print tablero
    
main2 = do
    respuesta <- getLine
    putStrLn ("TU respuesta es: " ++ respuesta)
