module Test.Todo.MainSpec (spec) where

import Prelude hiding (log)
import Control.Monad.Trans.Class (lift)
import Control.Monad.TestFixture
import Control.Monad.TestFixture.TH
import Test.Hspec

import Todo.Types
import Todo.Main (main)
import Todo.Parts (HasCommand, Commander)

mkFixture "Fixture" [''HasCommand, ''Commander]

spec :: Spec
spec = do
  describe "main" $ do
    it "should appendTask" $ do
      calls <- logTestFixtureT main def
        { _getCommand = do
            log "getCommand"
            return Append
        , _appendTask = do
            log "appendTask"
        }
      calls `shouldBe` ["getCommand", "appendTask"]
