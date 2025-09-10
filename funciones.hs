sumar :: Integer -> Integer -> Integer
sumar x y= x+y

factorial :: Integer -> Integer

factorial n = n * factorial (n-1)

menu :: IO()
menu = do
    putStrLn("=== MENU ===")
    putStrLn("¿Que deseas hacer?")
    putStrLn("1) Factorial")
    opcion <- getLine

    case opcion of
        "1" -> do
            putStrLn("Introduce el numero: ")
            n1 <- getLine
            let x = read n1 :: Integer
            putStrLn("El resultado es: "++ show (factorial x))
            menu
        "2" -> do
            putStrLn("Adios")
        _ -> do
            putStrLn("Favor de poner una opcion valida")
            menu
            
--public static void main
main :: IO ()
main = print(sumar 10 20) 
main = print(factorial 5)
main = menu 

-- cd 2_haskell
-- ghci
-- :load funciones.hs