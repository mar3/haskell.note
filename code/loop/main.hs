#!/usr/bin/env runghc
-- coding: utf-8

-- *********************************************************************
-- 与えられた引数を必ず0にしてしまう関数
-- *********************************************************************
get0 :: Int -> Int
get0 x = 0

-- *********************************************************************
-- 与えられた Bool 値を逆にする関数
-- *********************************************************************
xnot :: Bool -> Bool
xnot False = True
xnot True = False

-- *********************************************************************
-- "0" ～ "9" までの文字列を名前に変換する関数
-- *********************************************************************
to_string :: String -> String
to_string "0" = "zero"
to_string "1" = "one"
to_string "2" = "two"
to_string "3" = "three"
to_string "4" = "four"
to_string "5" = "five"
to_string "6" = "six"
to_string "7" = "seven"
to_string "8" = "eight"
to_string "9" = "nine"
to_string x = show x

-- *********************************************************************
-- "ガード"
-- パターンマッチングに似ているがちょっと違う
-- 場合分け
-- *********************************************************************
bmiTell :: Double -> String
bmiTell bmi
	| bmi <= 18.5 = "Tou're underweight"
	| bmi <= 25.0 = "You're supposedly normal."
	| bmi <= 30.0 = "You're fat!"
	| otherwise   = "You're a whale"

-- *********************************************************************
-- MAIN
-- *********************************************************************
main :: IO()
main = do

	putStrLn "--- Digit to Name ---"
	print $ to_string "0"
	print $ to_string "1"
	print $ to_string "2"
	print $ to_string "3"
	putStrLn ""

	putStrLn "--- Not ---"
	print $ xnot True
	print $ xnot False
	putStrLn ""

	putStrLn "--- 0 ---"
	print $ get0 999
	putStrLn ""

	putStrLn "Ok."
