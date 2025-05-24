module Main where

-- Import native modules
import System.IO
import Control.Exception (try, IOException)

-- Import Utils modules
import Utils.ParseTable

-- Import Types
import Types.Table (Table)


main :: IO ()
main = do
    putStrLn "Encontrando rutas para salir del laberinto de Creta..."
    getTable <- Utils.ParseTable.parseTable "input.txt"
    let isTable = case getTable of
            Left e  -> Nothing
            Right c -> Just c

    case isTable of
        Nothing -> putStrLn "Error al crear el tablero"
        Just _  -> putStrLn "Tablero creado con exito"
    
    let table = maybe [] id isTable
    print table -- para debug
    mapM_ (putStrLn . (:[])) (concat table)

