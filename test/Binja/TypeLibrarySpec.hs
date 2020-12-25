module Binja.TypeLibrarySpec ( spec ) where

import Binja.Prelude

import qualified Binja.Core as BN
import Binja.Core (BNBinaryView)
import Test.Hspec
import qualified Binja.TypeLibrary as BT
import qualified Data.Text as Text

typeLibTestBin :: FilePath
typeLibTestBin = "res/test_bins/TypeLibTest/TypeLibTest"

getBv :: FilePath -> IO BNBinaryView
getBv fp = do
  (Right bv) <- BN.getBinaryView fp
  BN.updateAnalysisAndWait bv
  return bv

getTypeLibTest :: IO BNBinaryView
getTypeLibTest = getBv typeLibTestBin


spec :: Spec
spec = describe "Binja.TypeLibrary" $ do

  context "Type Lib Test" $ do
    bv <- runIO getTypeLibTest

    tlibs <- runIO $ BN.getBinaryViewTypeLibraries bv

    it "should find a type library for TypeLibTest bin" $ do
      length tlibs `shouldBe` 1

    xs <- runIO $ BT.getFunctionTypes (head tlibs)

    it "should load some type lib FunctionTypes" $ do
      null xs `shouldBe` False

    it "should getFunctionTypes without crashing" $
      Text.length (show xs) `shouldBe` Text.length (show xs)

    ys <- runIO $ BT.getNamedReferenceTypes (head tlibs)

    it "should getNamedReferenceTypes without crashing" $
      Text.length (show ys) `shouldBe` Text.length (show ys)

    -- let putc = head . filter (\x -> x ^. BT.name == "_IO_putc") $ xs

    -- it "putc should return an int" $ do
    --   putc ^. BT.returnType . Var.typeClass `shouldBe` IntegerTypeClass
    --   putc ^. BT.returnType . Var.signed `shouldBe` True

    -- it "putc first arg should be an int" $ do
    --   putc ^? BT.argumentTypes . ix 0 . Var.typeClass `shouldBe` Just IntegerTypeClass
    --   putc ^? BT.argumentTypes . ix 0 . Var.signed `shouldBe` Just True
      
