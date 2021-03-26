using System;

namespace Ejercicio1
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Returns the smallest positive integer that does not occur in array");
            int small = 0;
            int[] numbers = { 1, 3, 5, 7, 9 };
            small = smallest(numbers);
            Console.WriteLine("smallest is:{0}",small);
            Console.ReadLine();
        }

        public static int smallest(int[] numbers) 
        {
            return numbers[0];
        }
    }
}
