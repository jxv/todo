module Todo.Main
  ( main
  ) where

import Todo.Parts
  ( HasCommand(getCommand)
  , Commander(appendTask)
  )

main :: (HasCommand m, Commander m) => m ()
main = do
  command <- getCommand
  appendTask
