
-- what's missing is to keep decomponsing until it's impossible to decompose
-- anymore and check when it's not possible to decompose anymore
-- this is from a challenge found here:
-- http://codegolf.stackexchange.com/questions/75081/find-the-powertrain
powertrain_wrapper :: Int -> Int
powertrain_wrapper x = powertrain (show x)

powertrain :: [Char] -> Int
powertrain [] = 1
powertrain xs
	| lenx == 1 = (read xs :: Int)
	where lenx = length xs
powertrain (x1:x2:xs) = ((digitToInt x1) ^ (digitToInt x2)) * powertrain xs