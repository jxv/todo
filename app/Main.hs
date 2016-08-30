module Main (main) where

import qualified Todo.Main as Todo (main)
import qualified Todo.System as Todo (runIO)

main :: IO ()
main = Todo.runIO Todo.main
