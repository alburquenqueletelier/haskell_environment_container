es_divisible :: Int -> Int -> Int -> Bool--calcula si un numero tiene un divisor exacto en un rango
es_divisible n i final 
             | (n `mod` i) == 0 = True
             | (i == final) = False
             | otherwise =  es_divisible n (i + 1) final

es_primo :: Int -> Bool
es_primo n
         | n == 1 = False -- el 1 no es primo
         | n == 2 = True -- el 2 es primo
         | es_divisible n 2 (n-1) == False = True  -- si no es divisible por ningun numero entre 2 y su antecesor, es primo
         | otherwise = False -- si no cumple ninguna de las condiciones anteriores, no es primo


main :: IO ()
main = do
    let list = [1..50]
    putStrLn ""
    putStrLn "la lista es:"
    print list
    putStrLn ""
    putStrLn "la lista con solo los numeros primos:"
    print(filter es_primo list)