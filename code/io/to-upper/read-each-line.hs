#!/usr/bin/env runghc
-- coding: utf-8

import System.IO
import Data.Char(toUpper)

{-
#######################################################
# input.txt から読み込んだ内容を大文字に変換し、
# output.txt に書きだします。
#######################################################
-}

main = do

	in_handle <- openFile "input.txt" ReadMode
	out_handle <- openFile "output.txt" WriteMode

	line <- hGetContents in_handle
	hPutStr out_handle (map toUpper line)

	hClose in_handle
	hClose out_handle
