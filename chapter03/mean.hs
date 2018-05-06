-- Return the mean of a list
mean :: Fractional a => [a] -> a
mean xs = sum_xs / length_xs
  where sum_xs = sum xs
        length_xs = fromIntegral $ length $ xs
