-- Return the number of elements of a list
myLength :: [a] -> Int
myLength [] = 0
myLength (_:xs) = 1 + myLength xs

myLengthTest :: Bool
myLengthTest = and
  [
    0 == myLength [],
    1 == myLength ["one"],
    2 == myLength [True, False],
    3 == myLength [1, 2, 3]
  ]
