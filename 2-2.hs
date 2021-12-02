#!/usr/bin/runghc

import Data.Char

data Instr = Forward Int
           | Down    Int
           | Up      Int
    deriving (Read)

readInstr :: String -> Instr
readInstr []     = undefined
readInstr (x:xs) = read $ toUpper x : xs

move :: (Int, Int, Int) -> Instr -> (Int, Int, Int)
move (a, x, d) (Forward n) = (a    , x + n, d + a*n)
move (a, x, d) (Down    n) = (a + n, x    , d      )
move (a, x, d) (Up      n) = (a - n, x    , d      )

main :: IO ()
main = do
    instrs <- fmap (map readInstr . lines) $ readFile "2.txt"
    let pos@(_, x, d) = foldl move (0, 0, 0) instrs
    print pos
    print $ x*d
