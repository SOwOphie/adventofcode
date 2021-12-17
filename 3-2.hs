#!/usr/bin/runghc

import Data.Bits
import Data.List

mostcommon :: Bool -> [[Bool]] -> [Bool]
mostcommon draw input =
    let len = length input
        f :: Int -> Bool
        f n | 2*n < len = False
            | 2*n > len = True
            | otherwise = draw
    in  map (f . length . filter id) $ transpose input


rating :: Bool -> Int -> [[Bool]] -> [Bool]
rating _    _   [value] = value
rating crit bit input   =
    let mc = mostcommon True input
        bv = if crit then mc !! bit else not $ mc !! bit
    in rating crit (bit + 1) $ filter ((== bv) . (!! bit)) input


dec :: [Bool] -> Int
dec = foldl (\n b -> (n `shiftL` 1) .|. if b then 1 else 0) 0

main :: IO ()
main = do
    input <- fmap (map (map (== '1')) . lines) $ readFile "3.txt"
    let oxy = dec $ rating True  0 input
        co2 = dec $ rating False 0 input
    print $ oxy * co2
