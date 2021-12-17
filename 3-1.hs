#!/usr/bin/runghc

import Data.Bits
import Data.List

dec :: [Int] -> Int
dec = foldl (\n b -> (n `shiftL` 1) .|. b) 0

main :: IO ()
main = do
    input <- lines <$> readFile "3.txt"
    let len   = length input
        γbits = map ((\n -> if 2*n > len then 1 else 0) . length . filter (== '1')) $ transpose input
        γ     = dec γbits
        ε     = dec $ map (1-) γbits
    print $ γ * ε
