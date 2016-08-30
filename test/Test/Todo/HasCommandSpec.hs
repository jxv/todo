module Test.Todo.HasCommandSpec (spec) where

import Prelude hiding (log)
import Control.Monad.Trans.Class (lift)
import Control.Monad.TestFixture
import Control.Monad.TestFixture.TH
import Test.Hspec

import Todo.Types
import Todo.HasCommandImpl (getCommand)
import Todo.Parts (Console)

mkFixture "Fixture" [''Console]

pop :: Monad m => TestFixtureT Fixture [a] [b] m b
pop = do
  x:xs <- get
  put xs
  return x

spec :: Spec
spec = do
  describe "getCommand" $ do
    it "should get Append on first try" $ do

      (actual, calls) <- evalTestFixtureT getCommand def
        { _getLine = do
            log "getLine"
            return "1"
        }

      calls `shouldBe` ["getLine"]
      actual `shouldBe` Append

    it "should get Append on second try" $ do

      (actual, _, calls) <- runTestFixtureT getCommand def
        { _getLine = do
            log "getLine"
            input <- pop
            return input
        }
        ["BAD","1"]

      calls `shouldBe` ["getLine", "getLine"]
      actual `shouldBe` Append
