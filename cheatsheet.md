doubleMe x = x + x
doubleUs x y = x*2 + y*2
doubleUs' x y = doubleMe x + doubleMe y
-- if statement
doubleSmallNumber x = if x > 100
                        then x
                        else doubleMe x

--
-- lists
--
-- concatenate list [9,10,11,12] to end of list a (may take some time for long lists)
-- concatenation at the end works only with two lists, use [5] for a single element
a = [1,2,3,4]
b = [9,10,11,12]
a ++ b
-- concatenate an element to the beginning of list a, can only concatenate elements
5 : a
-- index element 3 of list a
a !! 3
-- empty list
[]
-- list of empty lists
[[],[],[]]

head a -- returns 1
tail a -- returns [2,3,4]
last a -- returns 4
init a -- returns [1,2,3]
length a -- returns 4
null a -- returns false : checks is list is empty
reverse a -- returns [4,3,2,1]
take 2 a -- returns [1,2] : takes the first 2 elements
drop 2 a -- returns [3,4] : takes away the first 2 elements
minimum a -- returns 1
maximum a -- returns 4
sum a -- returns 10
product a -- returns 24
elem 4 a -- returns True : checks membership
4 `elem` a

[1..20] -- generating lists
['a'..'z']
[2,4..20] -- specifying step, using this for floating point numbers can give weird numbers because FP is not completely precise
[1..] -- infinite list, more useful for something like below
take 24 [13,26..]
take 24 (cycle [1,2,3])
take 42 (cycle "It's a me, Mario!")
take 10 (repeat 5)
replicate 5 10 -- equivalent to the above

-- list comprehension
[x*2 | x <- [1..10]] -- x*2 is the output function, x <- [1..10] is the input list
[x*2 | x <- [1..10], x*2 >= 12] -- adding a predicate (condition)
-- weeding out lists by predicates is also called filtering
[x | x <- [1..20], x /= 13, x /= 15, x /= 18] -- multiple predicates
[ x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50, x*y < 100] -- multiple lists

-- Let's say we want a comprehension that replaces each odd number greater than 10 with "BANG!" and each odd number that's less than 10 with "BOOM!"
boomBang xs = [if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

length' xs = sum [1 | _ <- xs] -- _ means that we don't care what we'll draw from the list anyway so instead of writing a variable name that we'll never use, we just write _; replaces every element of a list with 1 and then sums that up

[(1,2),(8,11,5),(4,5)] -> INVALID
[(1,2),(8,11),(4,5)] -> VALID
[("Christopher", "Walken", 55),("Isaac", "miria", 13)] -> VALID

Use tuples when you know in advance how many components some piece of data should have.

fst (8,11) -- returns 8; takes a pair and returns its first component
snd (8,11) -- returns 11; takes a pair and returns its second component
zip [1,2,3,4,5] [5,5,5,5,5] -- returns [(1,5),(2,5),(3,5),(4,5),(5,5)]
zip [5,3,2,6,2,7,2,5,4,6,6] ["im","a","turtle"] -- [(5,"im"),(3,"a"),(2,"turtle")]; longer list gets left out