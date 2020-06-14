import System.Environment
import System.TimeIt

live :: Integer -> Integer -> Integer -> Integer -> Integer -> Integer -> Int -> Integer
live o l a la aa laa days | days == 0 = o + l + a + la + aa + laa
live o l a la aa laa days = (live
    (o + a + aa)
    (o + l + a + la + aa + laa)
     o
     l
     a
     la
     (days - 1))


run :: Int -> Integer
run n = live 1 0 0 0 0 0 n

main = do
  args <- getArgs
  let number = head args
  let n = read number :: Int
  timeIt $ putStrLn ("Result: " ++ show (run n))
