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
