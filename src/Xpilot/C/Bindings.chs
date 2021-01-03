{-# OPTIONS_GHC -fno-warn-orphans #-}

module Xpilot.C.Bindings where

import Prelude

import Foreign.C.Types
import Foreign.Storable
import Foreign.Ptr
import Foreign.Marshal.Alloc

#include <xpilotai.h>
#include <stdio.h>
  
{#context lib="xpilotai" #}

-- {#fun unsafe start as start' {`Int', castPtr `Ptr (Ptr Char)'} -> `Int' #}

foreign import ccall "start" start' ::
    FunPtr (IO ()) -> Int -> Ptr (Ptr Char) -> IO Int

foreign import ccall "wrapper" makeCallbackLoopWrapper ::
    (IO ()) -> IO (FunPtr (IO ()))

-- {#fun unsafe startAI as startAI' {`Int', castPtr `Ptr (Ptr Char)'} -> `Int' #}

--  #c
-- AI_loop() {
--   printf("ok there");
--   turnLeft(1);
-- }
-- #endc
 
{#fun unsafe selfX as selfX {} -> `Int' #}

{#fun unsafe turnLeft as turnLeft {`Int'} -> `()' #}

{#fun unsafe turnRight as turnRight {`Int'} -> `()' #}

{#fun unsafe fireShot as fireShot {} -> `()' #}




