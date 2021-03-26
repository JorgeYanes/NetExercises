using System;

namespace Ejercicio1
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Returns the smallest positive integer that does not occur in array");
            int small = 0;
            var numbers = ArrayRand(-1000, 1000);
            var Init = DateTime.Now;
            small = smallest(numbers);
            var End = DateTime.Now;
            Console.WriteLine("smallest is:{0}, time:{1} seconds",small, (End-Init).TotalSeconds);
            Console.ReadLine();
        }

        public static int smallest(int[] numbers)
        {
            int bigger = numbers[0];
            int isInt = 0;
            int small = 1;
            for (int i = 1; i < numbers.Length; i++)
            {
                if (numbers[i] > bigger)
                    bigger = numbers[i];
            }
            for (int i = bigger-1; i > -1; i--)
            {
                for (int j = 0; j < numbers.Length; j++)
                {
                    if (numbers[j] == i)
                    {
                        isInt = 1;
                        break;
                    }
                }
                if (isInt == 0)
                {
                    small = i;
                    break;
                }
                else 
                {
                    if (i == 0)
                    {
                        small = bigger + 1;
                        break;
                    }
                }
            }
            return small;
        }

        private static int[] ArrayRand(int rangeInit, int rangeEnd)
        {
            Random rnd = new Random();
            int[] result = new int[Math.Abs(rangeInit) + Math.Abs(rangeEnd)];
            
            for (int i = 0; i < result.Length; i++)
            {
                result[i] = rnd.Next(rangeInit, rangeEnd);
            }
            return result;
        }
    }
}
