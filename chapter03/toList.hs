data List a = Cons a (List a)
            | Nil
              deriving (Show)

-- Given an element from type List a, return the equivalent [a]
toList :: List a -> [a]
toList (Cons x xs) = x : toList xs
toList Nil         = []

toListTest :: Bool
toListTest = and
  [
    ([] :: [Int]) == toList (Nil :: List Int),
    [1] == toList (Cons 1 Nil),
    "123" == toList (Cons '1' (Cons '2' (Cons '3' Nil)))
  ]
