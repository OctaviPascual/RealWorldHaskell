-- Represents the direction of the angle formed by three points
-- LEFT means that the points are counterclockwise
-- RIGHT means that the points are clockwise
-- STRAIGHT means that the points are collinear
data Direction = LEFT | RIGHT | STRAIGHT deriving (Show, Eq)

-- Represents a two-dimensional point
data Point2D = Point2D Double Double deriving (Show, Eq)

-- Return the direction that form three points
-- https://en.wikipedia.org/wiki/Graham_scan#Pseudocode
direction :: Point2D -> Point2D -> Point2D -> Direction
direction (Point2D x1 y1) (Point2D x2 y2) (Point2D x3 y3)
  | determinant > 0   = LEFT
  | determinant < 0   = RIGHT
  | otherwise         = STRAIGHT
  where determinant = (x2 - x1) * (y3 - y1) - (y2 - y1) * (x3 - x1)

directionTest :: Bool
directionTest = and
  [
    LEFT == direction (Point2D 1 0) (Point2D 1 1) (Point2D 0 1),
    RIGHT == direction (Point2D 0 1) (Point2D 1 1) (Point2D 1 0),
    STRAIGHT == direction (Point2D 1 1) (Point2D 2 2) (Point2D 3 3)
  ]


-- Return the direction of each successive triple of points 
directions :: [Point2D] -> [Direction]
directions (a:b:c:ps) = direction a b c : directions (b:c:ps)
directions _          = []

directionsTest :: Bool
directionsTest = and
  [
    [LEFT, LEFT] == directions [a, b, c, d],
    [RIGHT, RIGHT] == directions [a, d, c, b],
    [STRAIGHT, STRAIGHT] == directions [a, a, a, a]
  ]
  where a = Point2D 0 0
        b = Point2D 1 0
        c = Point2D 1 1
        d = Point2D 0 1


-- TODO: Implement Graham's scan algorithm for the convex hull
-- https://en.wikipedia.org/wiki/Graham_scan
