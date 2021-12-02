#!/usr/bin/runghc

main :: IO ()
main = do
    nums <- fmap (map read . lines) $ readFile "1.txt"
    let wins = zipWith3 (\a b c -> a + b + c) (nums) (drop 1 nums) (drop 2 nums)
    print $ foldl (\n (a, b) -> if a < b then n + 1 else n) 0 $ zip wins $ drop 1 (wins :: [Int])
