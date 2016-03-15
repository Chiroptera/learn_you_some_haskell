doubleMe x = x + x
doubleUs x y = x*2 + y*2
doubleUs' x y = doubleMe x + doubleMe y
-- if statement
doubleSmallNumber x = if x > 100
						then x
						else doubleMe x

-- Let's say we want a comprehension that replaces each odd number greater than 10 with "BANG!" and each odd number that's less than 10 with "BOOM!"
boomBang xs = [if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

length' xs = sum [1 | _ <- xs] -- replaces every element of a list with 1 and then sums that up


let triangles = [ (a,b,c) | a <- [1..10], b <- [1..10], c <- [1..10], a*a+b*b==c*c, a+b+c==24]