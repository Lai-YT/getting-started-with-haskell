import System.IO  -- hFlush


main = do
  -- putStr won't automatically break the line.
  putStr "Please enter your name: "
  -- putStr doesn't flush the buffer,
  -- so you'll miss the output.
  -- Manually flushes it.
  hFlush stdout
  name <- getLine
  putStrLn ("hello, " ++ name)
