{- PLEASE REVIEW types.hs, tuples.hs, and generics.hs FIRST!!!!!

Typeclasses are a sort of interface that defines some behavior. If a type
  is part of a typeclass, it means that the type supports and implements
  the the typeclasses behavior. EX:

 recall that we used :t to find the type of a value:  -}
    :t 5  -- 5 :: Num p => p

-- we can also use :t on operators:
    :t (==)  -- Eq a => a -> a -> Bool

{- so what does 'Eq a => a -> a -> Bool' mean? Well lets break it down:
    1) a is a type variable (as discussed in generics.hs) that can be used
        to represent any data type
    
    2) (Eq a) means that the type variable, a, MUST implement the Eq
        typeclass (think interface)

    3) a -> a -> Bool means that == takes in a value and a value and returns
        a bool. So == is actually a function!!!

    So to sum the above up == is a function that takes in two variables of
        the SAME TYPE that also implement the Eq interface and returns a bool

    So what is Eq exactly. Well the Eq typeclasses deals with equality testing. 
        So if there's an Eq class constraint for a type variable in a function,
        it uses == or /= somewhere inside its definition.

    Lets do a few more
-}

:t (>)          --  (>) :: Ord a => a -> a -> Bool
-- This means that the function > takes in two variables of the same type that 
--  also implement the Ord typeclass and returns a bool.


{- By now you might have realizes that ANYTHING before the => is a class constant

    SEE THE MEETING_2 README FOR AN IMAGE THAT SHOWS ALL TYPECLASSES AND TYPES

-}

-- Now lets rewrite our add function once more to only work for all numbers:
--   For this we will use the Num typeclass. The Num's members have the property
--   of being able to act like numbers, so they can be added, mult, div, sub, ect...

--  previously we had 
add :: Int -> Int -> Int -- This only works for ints!
add x y = x + y

add' 5 6    -- 11
add' 5.5 6  -- Error

{- The num typeclass is implemented by all numbers: Int Factional, Float, Decimal, ect...-}
add' :: (Num a) => a -> a -> a
add' x y = x + y

add' 5 6    -- 11
add' 5.5 6  -- 11.5

-- Perfect now add works for any data type that extends Num!!!!


-- Lets make a function called greaterThan that takes in two values and 
--   determines if the first value is greater than the second.

{- Hint: The Ord typeclass is used for types that have ordering! This means
     that any type that implements Ord has the functions: >, <, ==, >=, <=, ect...

-}
greaterThan :: (Ord a) => a -> a -> Bool
greaterThan x y = if (x > y) then True else False

greaterThan 5 6          -- False
greaterThan 6 5.5        -- True
10 `greaterThan` 11      -- False
greaterThan 'j' 'a'      -- True


{- IMPORTANT!!!!

For now on we will be trying to write functions as Abstract as possible
    so it is VERY IMPORTANT that you understand types, type variables, and
    typeclasses!

Please feel free to email me or ask me in school to go over anything you dont
    understand!!!


additional info: http://learnyouahaskell.com/types-and-typeclasses#typeclasses-101


-}