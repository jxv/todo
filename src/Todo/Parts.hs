module Todo.Parts
  ( HasCommand(..)
  ) where

import Todo.Types

class Monad m => HasCommand m where
  getCommand :: m Command
