#!/usr/bin/env runghc

import Data.List
import Data.List.Split
import System.IO.Unsafe

cost :: [Int] -> Int -> Int
cost l m = sum $ map cost' l
    where
        cost' p = let dist = abs $ m-p
                  in  (dist*dist + dist) `div` 2

main :: IO ()
main = do
    input <- fmap (map read . splitOn ",") $ readFile "7.txt"
    print $ minimum $ map (cost input) $ [minimum input .. maximum input]
