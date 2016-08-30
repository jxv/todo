module Todo.HasCommandImpl
  ( getCommand
  ) where

import Prelude hiding (getLine)

import Todo.Types
import Todo.Parts
  ( Console(getLine)
  )

getCommand :: Console m => m Command
getCommand = do
  _ <- getLine
  return Append
