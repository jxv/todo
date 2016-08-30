module Todo.System
  ( System
  , runIO
  ) where

import Control.Monad.IO.Class (MonadIO)

newtype System a = System { unSystem :: IO a }
  deriving (Functor, Applicative, Monad, MonadIO)

runIO :: System a -> IO a
runIO system = unSystem system
