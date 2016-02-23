#!/usr/bin/env runghc
-- coding: utf-8

import System.IO
import Data.Char(toUpper)

main = do
	inStr <- readFile "input.txt"
	--writeFile "output.txt" (map toUpper inStr)
	writeFile "output.txt" (map toUpper inStr)
