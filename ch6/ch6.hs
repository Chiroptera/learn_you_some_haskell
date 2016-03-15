applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = (f x y):(zipWith' f xs ys)

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
	where g x y = f y x

-- (b -> a -> c) = (b -> (a -> c)) = b -> a -> c
-- g x y = f y x means that f x y = g x y, so we can write:
flip'' :: (a -> b -> c) -> b -> a -> c 
flip'' f y x = f x y

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
	| p x = x : filter' p xs
	| otherwise = filter' p xs

-- quicksort with filter = more readability
--quicksort_f :: (Ord a) => [a] -> [a]
--quicksort_f (x:xs) = 
--	let smallerSorted = quicksort_f (filter (<=x) xs)
--		biggerSorted = quicksort_f (filter (>x) xs)
--	in smallerSorted ++ [x] ++ biggerSorted

-- find the sum of all odd squares that are smaller than 10,000
-- sum (takeWhile (<10000) (filter odd (map (^2) [1..])))


-- we'll be dealing with Collatz sequences. We take a natural number. If that
-- number is even, we divide it by two. If it's odd, we multiply it by 3 and
-- then add 1 to that. We take the resulting number and apply the same thing to
-- it, which produces a new number and so on. In essence, we get a chain of
-- numbers. It is thought that for all starting numbers, the chains finish at
-- the number 1. So if we take the starting number 13, we get this sequence:
-- 13, 40, 20, 10, 5, 16, 8, 4, 2, 1.
chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain x = x : chain (if odd x then (x * 3 + 1) else (x `div` 2))

-- for all starting numbers between 1 and 100, how many chains have a length
-- greater than 15?
-- length (filter (\xs -> length xs > 15) (map chain [1..100])) --using a lambda

-- using folds
sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs

elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldl (\acc x -> if x == y then True else acc) False ys

-- map with fold
-- right fold (accumulator is on the right)
map'' :: (a -> b) -> [a] -> [b]
map'' f xs = foldr (\x acc -> f x : acc) [] xs

-- left fold (accumulator is on the left)
-- if I'd kept the f x : acc, it would have inverted the order
map''' :: (a -> b) -> [a] -> [b]
map''' f xs = foldl (\acc x -> acc ++ [f x]) [] xs

-- maximum, reverse, product, filter, head, last
maximum' :: (Ord a) => [a] -> a
maximum' xs = foldl1 (\x y -> if y > x then y else x) xs

reverse' :: [a] -> [a]
reverse' xs = foldl (\acc x -> x : acc) [] xs

product' :: (Num a) => [a] -> a
product' xs = foldr1 (*) xs

filter'' :: (a -> Bool) -> [a] -> [a]
filter'' f xs = foldr (\x acc -> if f x then x : acc else acc) [] xs

head' :: [a] -> a
head' xs = foldr1 (\x _ -> x) xs --we don't really care for the accumulator

last' :: [a] -> a
last' = foldl1 (\acc x -> x) -- it's assumed that the input is a list

-- How many elements does it take for the sum of the roots of all natural
-- numbers to exceed 1000?
-- remember filter doesn't work on infinite lists
-- length (takeWhile (<= 1000) (scanl1 (+) (map sqrt [1..]))) + 1

-- function application with $
-- $ has lowest precedence
-- sum (filter (> 10) (map (*2) [2..10])) can become
-- sum (filter (> 10) (map (*2) [2..10]))

-- f (g (z x)) can become
-- f (g (z x))

-- and we can also start treating function application as another function
-- map ($ 3) [(4+), (10*), (^2), sqrt] results in
-- [7.0,30.0,9.0,1.7320508075688772]

-- function composition = f(g(x))
--(.) :. (b -> c) -> (a -> b) -> a -> c
--f . g = \x -> f (g x)

-- map (\x -> negate (abs x)) [5,-3,-6,7,-3,2,-19,24] can become
-- map (negate . abs) [5,-3,-6,7,-3,2,-19,24] , which is more readable

-- map (\xs -> negate (sum (tail xs))) [[1..5],[3..6],[1..7]] becomes
-- map (negate . sum . tail) [[1..5],[3..6],[1..7]] 

-- fn x = ceiling (negate (tan (cos (max 50 x)))) becomes
-- fn = ceiling . negate . tan . cos . max 50 , allowing point free style