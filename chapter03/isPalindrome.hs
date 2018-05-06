-- Return whether a list is a palindrome
-- (Note that by using reverse function this is trivial)
isPalindrome :: Eq a => [a] -> Bool
isPalindrome []     = True
isPalindrome [_]    = True
isPalindrome (x:xs) = (x == last xs) && isPalindrome (init xs)

isPalindromeTest :: Bool
isPalindromeTest = and
  [
    True == isPalindrome [1],
    True == isPalindrome [1, 2, 1],
    True == isPalindrome [1, 2, 2, 1],
    False == isPalindrome [1, 2],
    False == isPalindrome [1, 2, 2, 3]
  ]
