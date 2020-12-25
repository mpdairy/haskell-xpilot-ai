{-# OPTIONS_GHC -fno-warn-orphans #-}

module Xpilot.C.Bindings where

import Prelude

import Foreign.C.Types
import Foreign.Storable
import Foreign.Ptr
import Foreign.Marshal.Alloc

#include <cAI.h>
#include <xpilotai.h>
#include <stdio.h>
  
{#context lib="cAI" #}

{#fun unsafe start as start' {`Int', castPtr `Ptr (Ptr Char)'} -> `Int' #}

{#fun unsafe startAI as startAI' {`Int', castPtr `Ptr (Ptr Char)'} -> `Int' #}

--  #c
-- AI_loop() {
--   printf("ok there");
--   turnLeft(1);
-- }
-- #endc
 
{#fun unsafe selfX as selfX {} -> `Int' #}





