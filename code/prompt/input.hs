#!/usr/bin/env runghc
-- coding: utf-8

main = do
	putStrLn "Are you OK?"
	user_answer <- getLine
	putStrLn $ "[" ++ user_answer ++ "]"
