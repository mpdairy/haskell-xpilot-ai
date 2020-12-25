module Main where

import Prelude

import Xpilot.C.Bindings as XP
import Xpilot.C.Helpers as XP

main :: IO ()
main = do
  XP.start ["./spinner"]
  putStr "hey\n"
