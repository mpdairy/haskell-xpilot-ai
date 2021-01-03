module Main where

import Prelude

import Xpilot.C.Bindings as XP
import Xpilot.C.Helpers as XP

brain :: IO ()
brain = do
  XP.turnRight 1
  XP.fireShot


main :: IO ()
main = do
  XP.start brain ["./spinner"]
  putStr "hey\n"
