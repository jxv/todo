module Test.Todo.MainSpec (spec) where

import Prelude hiding (log)
import Control.Monad.Trans.Class (lift)
import Control.Monad.TestFixture
import Control.Monad.TestFixture.TH
import Test.Hspec

import Todo.Types
import Todo.Main (main)
import Todo.Parts (HasCommand)

mkFixture "Fixture" [''HasCommand]

spec :: Spec
spec = do
  describe "main" $ do
    it "should be ..." $ do
      () `shouldBe` ()
