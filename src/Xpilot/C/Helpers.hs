module Xpilot.C.Helpers where

import Prelude

import Foreign.C.Types
import Foreign.Storable
import Foreign.Ptr
import Foreign.Marshal.Alloc
import Foreign.Marshal.Array

import Xpilot.C.Bindings


start :: IO () -> [String] -> IO Int
start aiCallback args = do
  chars <- traverse newArray args
  arr <- newArray chars
  f <- makeCallbackLoopWrapper aiCallback
  start' f (length args) arr
