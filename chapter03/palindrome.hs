-- Turn a list into a palindrome (in a naive way)
palindrome :: [a] -> [a]
palindrome xs = xs ++ reverse xs

palindromeTest :: Bool
palindromeTest = and
  [
    [1, 2, 2, 1] == palindrome [1, 2],
    [1, 2, 3, 3, 2, 1] == palindrome [1, 2, 3]
  ]
