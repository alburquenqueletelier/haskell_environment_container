cuadrado :: Int -> Int
cuadrado n = n^2

main :: IO()
main = do 
    let lista = [1..10]
    putStrLn ""
    putStrLn "la lista es:"
    print lista
    putStrLn ""
    putStrLn "la lista con sus elementos al cuadrado:"
    print(map cuadrado lista)
