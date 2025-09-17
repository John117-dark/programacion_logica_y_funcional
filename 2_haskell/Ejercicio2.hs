-- HASKELL - Nueva Asignación
-- Funciones personalizadas según especificaciones

-- Función 1: Calcular promedio de 4 números
promedio4 :: Double -> Double -> Double -> Double -> Double
promedio4 a b c d = (a + b + c + d) / 4

-- Función 2: Sumar monedas con valores específicos
sumarMonedas :: Double -> Double -> Double -> Double -> Double
sumarMonedas a b c d = a * 1.0 + b * 5.0 + c * 10.0 + d * 50.0

-- Función 3: Calcular volumen de una esfera
volumenEsfera :: Double -> Double
volumenEsfera radio = (4/3) * pi * (radio ** 3)

-- Función 4: Verificar si a, b y c son iguales
sonIguales :: Integer -> Integer -> Integer -> Bool
sonIguales a b c = (a == b) && (b == c)

-- Función 5: Verificar si a, b y c son diferentes
sonDiferentes :: Integer -> Integer -> Integer -> Bool
sonDiferentes a b c = (a /= b) && (b /= c) && (a /= c)

-- Función 6: Calcular precio final con descuentos
precioFinal :: Double -> Double
precioFinal precio
    | precio > 1000.0 = precio * 0.60  -- 40% descuento
    | precio > 500.0  = precio * 0.70  -- 30% descuento  
    | precio > 100.0  = precio * 0.90  -- 10% descuento
    | otherwise       = precio         -- Sin descuento

-- Función 7: Obtener la última cifra de un número
ultimaCifra :: Integer -> Integer
ultimaCifra n = abs n `mod` 10

-- Menú principal
menu :: IO()
menu = do
    putStrLn "\n=== MENU DE FUNCIONES - NUEVA ASIGNACIÓN ==="
    putStrLn "¿Qué función deseas probar?"
    putStrLn "1) Promedio de 4 números"
    putStrLn "2) Sumar monedas ($1, $5, $10, $50)"
    putStrLn "3) Volumen de una esfera"
    putStrLn "4) Verificar si tres números son iguales"
    putStrLn "5) Verificar si tres números son diferentes"
    putStrLn "6) Precio final con descuentos"
    putStrLn "7) Última cifra de un número"
    putStrLn "0) Salir"
    putStr "Opción: "
    opcion <- getLine
    
    case opcion of
        "1" -> do
            putStrLn "=== PROMEDIO DE 4 NÚMEROS ==="
            putStrLn "Introduce el primer número: "
            n1 <- getLine
            putStrLn "Introduce el segundo número: "
            n2 <- getLine
            putStrLn "Introduce el tercer número: "
            n3 <- getLine
            putStrLn "Introduce el cuarto número: "
            n4 <- getLine
            let a = read n1 :: Double
            let b = read n2 :: Double
            let c = read n3 :: Double
            let d = read n4 :: Double
            let resultado = promedio4 a b c d
            putStrLn $ "El promedio de " ++ show a ++ ", " ++ show b ++ ", " ++ show c ++ ", " ++ show d ++ " es: " ++ show resultado
            menu
            
        "2" -> do
            putStrLn "=== SUMAR MONEDAS ==="
            putStrLn "Valores: $1.00, $5.00, $10.00, $50.00"
            putStrLn "Cantidad de monedas de $1: "
            n1 <- getLine
            putStrLn "Cantidad de monedas de $5: "
            n2 <- getLine
            putStrLn "Cantidad de monedas de $10: "
            n3 <- getLine
            putStrLn "Cantidad de monedas de $50: "
            n4 <- getLine
            let a = read n1 :: Integer
            let b = read n2 :: Integer
            let c = read n3 :: Integer
            let d = read n4 :: Integer
            let resultado = sumarMonedas a b c d
            putStrLn $ "Total: $" ++ show resultado
            menu
            
        "3" -> do
            putStrLn "=== VOLUMEN DE UNA ESFERA ==="
            putStrLn "Introduce el radio de la esfera: "
            r <- getLine
            let radio = read r :: Double
            if radio < 0 then do
                putStrLn "Error: El radio no puede ser negativo"
                menu
            else do
                let resultado = volumenEsfera radio
                putStrLn $ "El volumen de una esfera con radio " ++ show radio ++ " es: " ++ show resultado
                menu
                
        "4" -> do
            putStrLn "=== VERIFICAR SI TRES NÚMEROS SON IGUALES ==="
            putStrLn "Introduce el primer número: "
            n1 <- getLine
            putStrLn "Introduce el segundo número: "
            n2 <- getLine
            putStrLn "Introduce el tercer número: "
            n3 <- getLine
            let a = read n1 :: Integer
            let b = read n2 :: Integer
            let c = read n3 :: Integer
            let resultado = sonIguales a b c
            putStrLn $ show a ++ ", " ++ show b ++ ", " ++ show c ++ " son iguales: " ++ show resultado
            menu
            
        "5" -> do
            putStrLn "=== VERIFICAR SI TRES NÚMEROS SON DIFERENTES ==="
            putStrLn "Introduce el primer número: "
            n1 <- getLine
            putStrLn "Introduce el segundo número: "
            n2 <- getLine
            putStrLn "Introduce el tercer número: "
            n3 <- getLine
            let a = read n1 :: Integer
            let b = read n2 :: Integer
            let c = read n3 :: Integer
            let resultado = sonDiferentes a b c
            putStrLn $ show a ++ ", " ++ show b ++ ", " ++ show c ++ " son diferentes: " ++ show resultado
            menu
            
        "6" -> do
            putStrLn "=== PRECIO FINAL CON DESCUENTOS ==="
            putStrLn "Descuentos:"
            putStrLn "- Más de $100: 10% descuento"
            putStrLn "- Más de $500: 30% descuento" 
            putStrLn "- Más de $1000: 40% descuento"
            putStrLn "Introduce el precio de compra: $"
            p <- getLine
            let precio = read p :: Double
            if precio < 0 then do
                putStrLn "Error: El precio no puede ser negativo"
                menu
            else do
                let resultado = precioFinal precio
                let descuento = precio - resultado
                putStrLn $ "Precio original: $" ++ show precio
                putStrLn $ "Descuento aplicado: $" ++ show descuento
                putStrLn $ "Precio final: $" ++ show resultado
                menu
                
        "7" -> do
            putStrLn "=== ÚLTIMA CIFRA DE UN NÚMERO ==="
            putStrLn "Introduce un número: "
            n <- getLine
            let numero = read n :: Integer
            let resultado = ultimaCifra numero
            putStrLn $ "La última cifra de " ++ show numero ++ " es: " ++ show resultado
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