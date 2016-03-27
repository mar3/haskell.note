#!/usr/bin/env runghc
-- coding: utf-8

import Data.UUID
--import System.Random

import Data.UUID
import Data.UUID.V1
import Data.UUID.V3 as V3
import Data.UUID.V4
import Data.UUID.V5 as V5

main = do

	putStrLn "[nextUUID]"
	uuid <- nextUUID
	print $ uuid

	putStrLn "[nextRandom]"
	uuid <- nextRandom
	print $ uuid

