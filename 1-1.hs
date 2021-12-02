#!/usr/bin/runghc

main :: IO ()
main = do
    nums <- fmap (map read . lines) $ readFile "1.txt"
    print $ foldl (\n (a, b) -> if a < b then n + 1 else n) 0 $ zip nums $ drop 1 (nums :: [Int])
