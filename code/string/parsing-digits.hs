#!/usr/bin/env runghc
-- coding: utf-8

main :: IO ()
main = do

	print (read "-2147483649" ::Int)
	print (read "-2147483648" ::Int)
	print (read "2147483647" ::Int)
	print (read "2147483648" ::Int)
