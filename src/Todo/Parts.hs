module Todo.Parts
  ( HasCommand(..)
  , Commander(..)
  , Console(..)
  ) where

import Todo.Types

class Monad m => HasCommand m where
  getCommand :: m Command

class Monad m => Commander m where
  appendTask :: m ()

class Monad m => Console m where
  getLine :: m String
