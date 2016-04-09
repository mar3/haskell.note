#!/usr/bin/env runghc
-- coding: utf-8

_what_is_this :: String -> String
_what_is_this something = do
	case something of
		"apple" -> "APPLE"
		"orange" -> "ORANGE"
		otherwise -> ""

main :: IO ()
main = do
	print $ _what_is_this "orange"
	print $ _what_is_this "apple"
	print $ _what_is_this "apples"
	return ()
