#!/usr/bin/env runghc

{-# LANGUAGE TupleSections #-}

import Data.List
import Data.List.Split
import Data.Maybe
import Safe

type Board = [[Int]]

diag :: [[a]] -> [a]
diag l = diag' 0 l
    where
        diag' :: Int -> [[a]] -> [a]
        diag' n []     = []
        diag' n (x:xs) = x !! n : diag' (n + 1) xs

boardScore :: [Int] -> Board -> Maybe Int
boardScore nums board =
    let marked  = map (map (\n -> if n `elem` nums then Nothing else Just n)) board
        score   = sum $ catMaybes $ concat marked :: Int
        winRow  = any (all (== Nothing))             marked
        winCol  = any (all (== Nothing)) $ transpose marked
        win     = winRow || winCol
    in if win then Just score else Nothing

doRounds :: [Int] -> [Int] -> [Board] -> [Int]
doRounds _     _      []     = []
doRounds drawn (n:ns) boards =
    let scores  = zip boards $ map (boardScore $ n:drawn) boards
        (w, l)  = partition (isJust . snd) scores
        wscores = reverse $ sort $ map ((*n) . fromJust . snd) w
    in wscores ++ doRounds (n:drawn) ns (map fst l)

main :: IO ()
main = do
    Just (rawnums, rawboards) <- fmap (uncons . splitWhen null . lines) $ readFile "4.txt"
    let nums       = map read $ wordsBy (== ',') $ concat rawnums :: [Int]
        boards     = map (map (map read . words)) rawboards :: [[[Int]]]
        order      = doRounds [] nums boards

    print $ last order
