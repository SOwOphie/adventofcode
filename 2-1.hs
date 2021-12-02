#!/usr/bin/runghc

import Data.Char

data Instr = Forward Int
           | Down    Int
           | Up      Int
    deriving (Read)

readInstr :: String -> Instr
readInstr []     = undefined
readInstr (x:xs) = read $ toUpper x : xs

move :: (Int, Int) -> Instr -> (Int, Int)
move (x, d) (Forward n) = (x + n, d    )
move (x, d) (Down    n) = (x    , d + n)
move (x, d) (Up      n) = (x    , d - n)

main :: IO ()
main = do
    instrs <- fmap (map readInstr . lines) $ readFile "2.txt"
    let pos@(x, d) = foldl move (0, 0) instrs
    print pos
    print $ x*d
