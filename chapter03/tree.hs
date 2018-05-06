data Tree a = Tree a (Maybe (Tree a)) (Maybe (Tree a))
              deriving (Show)

tree1 = Tree 1 Nothing Nothing
tree2 = Tree 1 (Just (Tree 2 Nothing Nothing)) Nothing
