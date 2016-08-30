module Todo.Parts
  ( HasCommand(..)
  , Commander(..)
  ) where

import Todo.Types

class Monad m => HasCommand m where
  getCommand :: m Command

class Monad m => Commander m where
  appendTask :: m ()
