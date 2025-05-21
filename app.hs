import System.IO
import Control.Exception (try, IOException)

-- define estructura string
type Table = [[Char]]

main :: IO ()
main = do
    putStrLn "Encontrando rutas para salir del laberinto de Creta..."
    getTable <- parseFile "input.txt"
    let isTable = case getTable of
            Left e  -> Nothing
            Right c -> Just c

    case isTable of
        Nothing -> putStrLn "Error al crear el tablero"
        Just _  -> putStrLn "Tablero creado con exito"
    
    let table = maybe [] id isTable
    print table -- para debug
    mapM_ (putStrLn . (:[])) (concat table)

parseFile :: FilePath -> IO(Either String Table)
parseFile path = do
    putStrLn "Leyendo archivo de tablero .txt ..."
    -- lectura de contenido de archivo
    content <- try (readFile path) :: IO (Either IOException String)
    return $ case content of
        Left e -> Left $ show e
        Right c -> Right $ lines c  -- NO eliminamos espacios, cada línea debe tener exactamente 3 caracteres
    

