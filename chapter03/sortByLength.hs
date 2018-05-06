import Data.List

-- Sort a list of lists based on the length of each sublist
sortByLength :: [[a]] -> [[a]]
sortByLength xs = sortBy compareLength xs
  where compareLength x y = compare (length x) (length y)

sortByLengthTest :: Bool
sortByLengthTest = and
  [
    [[1]] == sortByLength [[1]],
    [[3], [1,2]] == sortByLength [[1,2], [3]],
    [[], [3], [1,2]] == sortByLength [[1,2], [], [3]],
    ["is", "funny", "haskell"] == sortByLength ["haskell", "is", "funny"]
  ]
