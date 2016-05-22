#!/usr/bin/env runghc
-- coding: utf-8

_what_is_this :: String -> String
_what_is_this something = do

	-- case もパターンマッチの一つです。
	-- otherwise が存在しない場合、実行時エラーが発生します。
	--                 "Non-exhaustive patterns in case"
	case something of
		"apple" -> "( |`)"
		"orange" -> "( ::)"
		otherwise -> ""

main :: IO ()
main = do

	print $ _what_is_this "orange"
	print $ _what_is_this "apple"
	print $ _what_is_this "apples"

	return ()
