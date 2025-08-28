public class Expresiones {
    public static void main(String[] args) {
        // Inicializamos las variables
        int x = 10;
        int b = 10;
        int a = 5; // Se necesita definir a para la última expresión
        System.out.println("Resultados de las expresiones:");

        // Expresión #1
        // x++ -> Imprime el valor de x, luego incrementa x.
        System.out.println("Expresión #1: " + x++); // Imprime 10, luego x=11
        x = 10; // Reiniciamos x

        // Expresión #2
        // ++x -> Incrementa x primero, luego imprime el valor de x.
        System.out.println("Expresión #2: " + ++x); // x incrementa a 11, luego imprime 11
        x = 10; // Reiniciamos x

        // Expresión #3
        // b++ * -3 == -3 % x++ -> Se usa el valor actual de b y x, luego incrementa x y b.
        System.out.println("Expresión #3: " + (b++ * -3 == -3 % x++)); // b++ da 10, x++ da 10, imprime false
        x = 10; b = 10; // Reiniciamos x y b

        // Expresión #4
        // 30 - 10 /= % ++b + 30 % 7 * 2 (Error en la sintaxis original, lo corregimos a una expresión válida)
        b++; // b se incrementa a 11
        int result4 = 30 - (10 / (b + (30 % (7 * 2)))));
        System.out.println("Expresión #4: " + result4);
        b = 10; // Reiniciamos b

        // Expresión #5
        // x = -50 * x++ * 80 % b / 4 *= 8 -> Multiplica e incrementa, luego aplica *= 8.
        int result5 = -50 * x++ * 80 % b / 4;
        result5 *= 8;
        System.out.println("Expresión #5: " + result5); // Realiza operaciones y multiplica por 8
        x = 10; // Reiniciamos x

        // Expresión #6
        // b *= x++ - 8 + 3 - 5 / 4 % -3 + 8 -> Operación compleja con varios operadores.
        b *= (x++ - 8 + 3 - 5 / 4 % -3 + 8);
        System.out.println("Expresión #6: " + b); // Se evalúa la operación y asigna el resultado
        x = 10; // Reiniciamos x

        // Expresión #7
        // x = b * (50 / 30 * ++x + 80) -> b se usa para multiplicar con la operación de x.
        x = b * (50 / 30 * ++x + 80);
        System.out.println("Expresión #7: " + x);
        b = 10; // Reiniciamos b

        // Expresión #8
        // ++x % 20 == -x /= b % = --x -> Primer incrementa x y evalúa el módulo, luego se realiza la asignación.
        x++;
        boolean result8 = (++x % 20 == (-x / b % 2 == --x));
        System.out.println("Expresión #8: " + result8);
        x = 10; b = 10; // Reiniciamos x y b

        // Expresión #9
        // 1 *= b++ * b-- / 3 % ++b *= 10 + 1; (Error en la expresión original, no se puede asignar a 1)
        int result9 = b++ * b-- / 3 % ++b;
        result9 *= (10 + 1); // Multiplica por 11
        System.out.println("Expresión #9: " + result9);
        x = 10; b = 10; // Reiniciamos x y b

        // Expresión #10
        // -10 * -0 *= -10 *= x++ + x+= x*x; (Error, hay sintaxis incorrecta, pero lo corregimos)
        int result10 = -10 * -0;
        result10 *= -10; 
        result10 *= (x++ + x + x * x); // Calcula x*x luego asigna
        System.out.println("Expresión #10: " + result10);
        x = 10; // Reiniciamos x

        // Expresión #11
        // a * b == b++ + b-- + --b + x++ + x--; 
        boolean result11 = (a * b == b++ + b-- + --b + x++ + x--);
        System.out.println("Expresión #11: " + result11);
    }
}
