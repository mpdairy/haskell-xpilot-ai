module Xpilot.C.Helpers where

import Prelude

import Foreign.C.Types
import Foreign.Storable
import Foreign.Ptr
import Foreign.Marshal.Alloc
import Foreign.Marshal.Array

import Xpilot.C.Bindings


start :: [String] -> IO Int
start args = do
  chars <- traverse newArray args
  arr <- newArray chars
  startAI' (length args) arr
