trimIOString :: IO String
trimIOString = do {
          st <- getLine;
          return (trim st);
      }

trim = reverse.dropWhites.reverse.dropWhites
       where
        dropWhites = dropWhile (== ' ')