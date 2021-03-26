using System;

namespace Ejercicio2
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
        }

        int Solution(int[] numbers)
        {

            /*-----bug----
             nunca se cuanta con el elemento en la posición cero ya que el ciclo comienza a recorrer el array en i=1
            si el menor esta en dicha posición en metodo no devuelve el valor correcto
            Como solucion se puede comenzar a iterar en i=0 o inicializar a la variable small con el valor numbers[0],
            asumiento es valor por defecto como el menor.
            Solucion 1:
            Linea 24: int small = numbers[0];

            Solucion 2:
            Linea 28: for (int i = 0; i < numbers.Length; i++)
             */
            int small = 0;
            for (int i = 1; i < numbers.Length; i++)
            {
                if (numbers[i] < small)
                    small = numbers[i];
            }
            return small;
        }
    }
}
