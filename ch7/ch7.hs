import Data.List
import Data.Char

-- # Data.List module

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub -- list with unique members of input list

-- Let's use a fold to implement searching a list for a sublist.
search :: (Eq a) => [a] -> [a] -> Bool
search needle haystack =
	let nlen = length needle
	in foldl (\acc x -> if take nlen x == needle then True else acc) False (tails haystack)

-- # Data.Char module

caesar_encode :: Int -> String -> String  
caesar_encode shift msg = 
    let ords = map ord msg  
        shifted = map (+ shift) ords  
    in  map chr shifted

caesar_decode :: Int -> String -> String  
caesar_decode shift msg =  caesar_encode (negate shift) msg


-- # Data.Map module
-- 
find_key :: (Eq a) => a -> [(a,b)] -> b
find_key key dict = snd . head . filter (\(k,v) -> key == k) $ xs