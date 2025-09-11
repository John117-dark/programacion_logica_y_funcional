sumar :: Integer -> Integer -> Integer
sumar x y = x + y

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n-1)

-- Función principal del menú
menu :: IO()
menu = do
    putStrLn "\n=== MENU DE FUNCIONES HASKELL ==="
    putStrLn "¿Qué función deseas probar?"
    putStrLn "1)  Valor absoluto (abs)"
    putStrLn "2)  Techo (ceiling)"
    putStrLn "3)  Sucesor (succ)"
    putStrLn "4)  Mínimo (min)"
    putStrLn "5)  Máximo (max)"
    putStrLn "6)  División (div)"
    putStrLn "7)  Módulo (mod)"
    putStrLn "8)  Es par (even)"
    putStrLn "9)  Piso (floor)"
    putStrLn "10) Máximo común divisor (gcd)"
    putStrLn "11) Negación booleana (not)"
    putStrLn "12) Es impar (odd)"
    putStrLn "13) Signo (signum)"
    putStrLn "14) Segundo elemento tupla (snd)"
    putStrLn "15) Factorial (función personalizada)"
    putStrLn "16) Suma (funcion personalizada)"
    putStrLn "0)  Salir"
    opcion <- getLine
    
    case opcion of
        "1" -> do
            putStrLn ("Introduce un número: ")
            n <- getLine
            let x = read n :: Integer
            putStrLn $ "abs(" ++ show x ++ ") = " ++ show (abs x)
            menu
            
        "2" -> do
            putStrLn ("Introduce un número decimal: ")
            n <- getLine
            let x = read n :: Double
            putStrLn $ "ceiling(" ++ show x ++ ") = " ++ show (ceiling x)
            menu
            
        "3" -> do
            putStrLn ("Introduce un número: ")
            n <- getLine
            let x = read n :: Integer
            putStrLn $ "succ(" ++ show x ++ ") = " ++ show (succ x)
            menu
            
        "4" -> do
            putStrLn ("Introduce el primer número: ")
            n1 <- getLine
            putStrLn ("Introduce el segundo número: ")
            n2 <- getLine
            let x = read n1 :: Integer
            let y = read n2 :: Integer
            putStrLn $ "min(" ++ show x ++ ", " ++ show y ++ ") = " ++ show (min x y)
            menu
            
        "5" -> do
            putStrLn ("Introduce el primer número: ")
            n1 <- getLine
            putStrLn ("Introduce el segundo número: ")
            n2 <- getLine
            let x = read n1 :: Integer
            let y = read n2 :: Integer
            putStrLn $ "max(" ++ show x ++ ", " ++ show y ++ ") = " ++ show (max x y)
            menu
            
        "6" -> do
            putStrLn ("Introduce el dividendo: ")
            n1 <- getLine
            putStrLn ("Introduce el divisor: ")
            n2 <- getLine
            let x = read n1 :: Integer
            let y = read n2 :: Integer
            if y == 0 then do
                putStrLn "Error: División por cero"
                menu
            else do
                putStrLn $ "div(" ++ show x ++ ", " ++ show y ++ ") = " ++ show (div x y)
                menu
                
        "7" -> do
            putStrLn ("Introduce el primer número: ")
            n1 <- getLine
            putStrLn ("Introduce el segundo número: ")
            n2 <- getLine
            let x = read n1 :: Integer
            let y = read n2 :: Integer
            if y == 0 then do
                putStrLn "Error: Módulo por cero"
                menu
            else do
                putStrLn $ "mod(" ++ show x ++ ", " ++ show y ++ ") = " ++ show (mod x y)
                menu
                
        "8" -> do
            putStrLn ("Introduce un número: ")
            n <- getLine
            let x = read n :: Integer
            putStrLn $ "even(" ++ show x ++ ") = " ++ show (even x)
            menu
            
        "9" -> do
            putStrLn ("Introduce un número decimal: ")
            n <- getLine
            let x = read n :: Double
            putStrLn $ "floor(" ++ show x ++ ") = " ++ show (floor x)
            menu
            
        "10" -> do
            putStrLn ("Introduce el primer número: ")
            n1 <- getLine
            putStrLn ("Introduce el segundo número: ")
            n2 <- getLine
            let x = read n1 :: Integer
            let y = read n2 :: Integer
            putStrLn $ "gcd(" ++ show x ++ ", " ++ show y ++ ") = " ++ show (gcd x y)
            menu
            
        "11" -> do
            putStrLn ("Introduce un valor booleano (True/False): ")
            b <- getLine
            let x = read b :: Bool
            putStrLn $ "not(" ++ show x ++ ") = " ++ show (not x)
            menu
            
        "12" -> do
            putStrLn ("Introduce un número: ")
            n <- getLine
            let x = read n :: Integer
            putStrLn $ "odd(" ++ show x ++ ") = " ++ show (odd x)
            menu
            
        "13" -> do
            putStrLn ("Introduce un número: ")
            n <- getLine
            let x = read n :: Integer
            putStrLn $ "signum(" ++ show x ++ ") = " ++ show (signum x)
            menu
            
        "14" -> do
            putStrLn ("Introduce el primer elemento de la tupla: ")
            n1 <- getLine
            putStrLn ("Introduce el segundo elemento de la tupla: ")
            n2 <- getLine
            let x = read n1 :: Integer
            let y = read n2 :: Integer
            putStrLn $ "snd((" ++ show x ++ ", " ++ show y ++ ")) = " ++ show (snd (x, y))
            menu
            
        "15" -> do
            putStrLn ("Introduce el número para calcular factorial: ")
            n <- getLine
            let x = read n :: Integer
            if x < 0 then do
                putStrLn "Error: El factorial no está definido para números negativos"
                menu
            else do
                putStrLn $ "factorial(" ++ show x ++ ") = " ++ show (factorial x)
                menu
                
        "16" -> do
            putStrLn ("Introduce el primer número: ")
            n1 <- getLine
            putStrLn ("Introduce el segundo número: ")
            n2 <- getLine
            let x = read n1 :: Integer
            let y = read n2 :: Integer
            putStrLn $ "sumar(" ++ show x ++ ", " ++ show y ++ ") = " ++ show (sumar x y)
            menu
            
        "0" -> do
            putStrLn "¡Adiós!"
            
        _ -> do
            putStrLn "Favor de poner una opción válida"
            menu

-- Función principal
main :: IO ()
main = menu

-- Para ejecutar:
-- cd directorio_del_archivo
-- ghci
-- :load nombre_archivo.hs
-- main