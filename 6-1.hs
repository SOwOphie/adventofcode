#!/usr/bin/env runghc

import Data.List.Split

step :: [Int] -> [Int]
step []     = []
step (0:xs) = 6 : 8 : step xs
step (x:xs) = (x-1) : step xs

main :: IO ()
main = do
    fish <- fmap (map read . splitOn ",") $ readFile "6.txt"
    print $ length $ foldr ($) fish $ replicate 80 step
