-- Utils/ParseTable.hs
module Utils.ParseTable (
    parseTable -- Export the function you want to use
) where

import Types.Table (Table)
import Control.Exception (try, IOException)

parseTable :: FilePath -> IO(Either String Table)
parseTable path = do
    putStrLn "Leyendo archivo de tablero .txt ..."
    -- lectura de contenido de archivo
    content <- try (readFile path) :: IO (Either IOException String)
    return $ case content of
        Left e -> Left $ show e
        Right c -> Right $ lines c  -- NO eliminamos espacios, cada línea debe tener exactamente 3 caracteres
    