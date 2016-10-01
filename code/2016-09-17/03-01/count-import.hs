#!/usr/bin/env stack
-- stack --install-ghc runghc --package turtle
import Turtle

main = do
    ar1 <- arguments
    print $ head $ ar1



