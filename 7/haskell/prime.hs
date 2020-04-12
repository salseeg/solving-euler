import System.Environment
import System.TimeIt

is_prime :: Int -> Int -> Bool
is_prime x div | x < 2 = False
               | (div * div) > x = True
               | (rem x div) > 0 = is_prime x (div + 1)
is_prime _ _ = False

count_primes :: Int -> Int -> Int
count_primes x 0 = x - 1
count_primes x n | (is_prime x 2) = count_primes (x + 1) (n - 1)
count_primes x n = count_primes (x + 1) n

main = do
  args <- getArgs
  let number = head args
  let n = read number :: Int
  timeIt $ putStrLn ("Result: " ++ show (count_prime 2 n))
