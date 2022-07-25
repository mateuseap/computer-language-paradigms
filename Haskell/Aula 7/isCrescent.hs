isCrescent :: (Int -> Int) -> Int -> Bool
isCrescent f 0                   = True
isCrescent f n | f n >= f (n-1)  = isCrescent f (n-1)
               | otherwise       = False

cresc n = n

decresc 0 = 20
decresc 1 = 15
decresc 2 = 10
decresc 3 = 5
decresc 4 = 0