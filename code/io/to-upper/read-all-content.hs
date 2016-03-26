#!/usr/bin/env runghc
-- coding: utf-8

import System.IO
import Data.Char(toUpper)

main = do
	file_content <- readFile "input.txt"
	writeFile "output.txt" (map toUpper file_content)
