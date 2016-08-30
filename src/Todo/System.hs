module Todo.System
  ( System
  , runIO
  ) where

import Control.Monad.IO.Class (MonadIO)
import Todo.Types
import Todo.Parts

newtype System a = System { unSystem :: IO a }
  deriving (Functor, Applicative, Monad, MonadIO)

runIO :: System a -> IO a
runIO system = unSystem system

instance HasCommand System where
  getCommand = error "getCommand"

instance Commander System where
  appendTask = error "appendTask"
