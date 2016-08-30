module Todo.HasCommandImpl
  ( getCommand
  , getCommandPrompt
  ) where

import Prelude hiding (getLine, putStrLn)

import Todo.Types
import Todo.Parts
  ( Console(getLine, putStrLn)
  )

getCommandPrompt :: String
getCommandPrompt = unlines
  [ "Enter Command:"
  , "1) Append"
  ]

getCommand :: Console m => m Command
getCommand = do
  putStrLn getCommandPrompt
  input <- getLine
  case input of
    "1" -> return Append
    _ -> getCommand
