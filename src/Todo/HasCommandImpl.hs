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
  input <- getLine
  case input of
    "1" -> return Append
    _ -> getCommand
