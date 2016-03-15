Haskell = don't tell it how to get what you want, tell it what you want = awesomesauce

Typeclasses

They're like interfaces in Java. Examples of built-in typeclasses are (all specify behavior):
 - Eq (objects can be compared)
 - Ord (objects can be ordered)
 - Show (objects have string representations)
 - Read (objects can be read from strings)
 - Enum (objects can be enumerated, can use list ranges)
 - Bounded (has upper and lower bound)
 - Num (numeric typeclass)
 - Integral (another numeric typeclass)
 - Floating (idem)

# Ch5
In Haskell all functions really take only one parameter. When a function takes more than one, it means that it's actually being decomposed into smaller functions that take only one parameter and then nested together (or chained). As an example, consider `max 4 5`. This is equivalent to `(max 4) 5`. `max 4` returns a function that takes a parameter and compares it with 4. And then we use that function with the input 5 to finally return the result we wanted. `max 4 5` is a _curried function_ and `max 4` is a _partially applied function_.

We can do the same with infix functions (functions that sit between parameters). E.g.:

```
divideByTen :: (Floating a) => a -> a  
divideByTen = (/10)
divideByTen 200 -- divides 200 by 10
```

The only caveat is subtraction with `-`, since `(-4)` actually means `-4`, so programmers should use `subtract` instead.

In essence, each function actually takes only one parameter and returns partially applied functions until we reach a function that returns a solid value.

This all means that we can write functions that return other functions. Not only that, we can also write functions that take other functions as input.

```
applyTwice :: a -> a -> (a -> a) -- 2 parameters as input, function as output
applyTwice :: (a -> a) -> a -> a  -- takes 1 function and some other value as input; 1 value as output
```