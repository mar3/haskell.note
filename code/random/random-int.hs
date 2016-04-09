#!/usr/bin/env runghc
-- coding: utf-8

import System.Random

get1 = do
	1

gen_next g = do
	(take 1 (randoms (mkStdGen 11) :: [Int]))
	--r <- System.Random.genRange g
	--let (n1, g1) = System.Random.next(r)

main = do
	let g = mkStdGen 11
	print $ (take 1 (randoms (mkStdGen 11) :: [Int]))
	print $ gen_next g
	putStrLn "Ok."
