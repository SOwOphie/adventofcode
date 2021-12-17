#!/usr/bin/env runghc

import Data.List
import Data.List.Split

median :: [Int] -> Int
median l = sort l !! (length l `div` 2)

main :: IO ()
main = do
    input <- fmap (map read . splitOn ",") $ readFile "7.txt"
    let m = median input
    print $ sum $ map (abs . (\x -> x - m)) input
