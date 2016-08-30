module Todo.ConsoleImpl
  ( getLine
  , putStrLn
  ) where

import Prelude hiding (getLine, putStrLn)

import qualified System.IO as IO (getLine, putStrLn)
import Control.Monad.IO.Class (MonadIO(liftIO))

getLine :: MonadIO m => m String
getLine = liftIO IO.getLine

putStrLn :: MonadIO m => String -> m ()
putStrLn = liftIO . IO.putStrLn
