data Tree a = Node a (Tree a) (Tree a)
            | Empty
              deriving (Show)

-- Return the height of the tree
height :: Tree a -> Int
height Empty = 0
height (Node x left right) = 1 + max (height left) (height right)

heightTest :: Bool
heightTest = and
  [
    0 == height Empty,
    1 == height (Node "x" Empty Empty),
    2 == height (Node "x" (Node "y" Empty Empty) Empty),
    3 == height (Node "x" (Node "y" (Node "z" Empty Empty) Empty) Empty)
  ]
