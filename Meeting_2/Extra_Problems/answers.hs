-- You may want to look at Meeting_2's readme for the types and typeclass chart

-- What typeclass would you use the check equality?
Eq

-- What typeclass would you use to incorporate all numbers
Num

-- What are the two types for a decimal?
Float
Double

-- What is the difference between the Int type and the Integer type? (you might need to do some research)
-- The Integer type is not bounded so it can produce very large numbers, while Int is bounded so it 
--    cannot produce as large of numbers.

-- What is the difference between the Num and Integral typeclass?
-- The Num typeclass incorporates ALL number types (real and integral), while Integral only incorporates Int and Integer which are whole numbers


-- write a function called append that appends two lists using generics
-- EX: append [1,2,3] [4,5,6] => [1,2,3,4,5,6]
append :: [a] -> [a] -> [a]
append l1 l2 = l1 ++ l2


-- write a function called isGreater that takes in two list and returns true if the first element of the
-- first list is greater then the first element fo the second list. If not then returns false. Use typeclasses and
-- generics!!!!!!!!
-- EX: isGreater [1,2,3] [4,5,6]  => False
--     isGreater [4,5,6] [1,2,3]  => True
isGreater :: (Ord a ) => [a] -> [a] -> Bool
isGreater l1 l2 = if (head l1) > (head l2)
                        then True
                        else False


-- write a function constructTuple that takes in two values and constructs a tuple from the given values.
-- EX: constructTuple 4 6       => (4,6)
--     constructTuple 'a' 1     => ('a',1)
constructTuple :: a -> b -> (a,b)
constructTuple x y = (x, y)