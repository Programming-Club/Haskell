
-- write a function called append that appends two lists using generics
-- EX: append [1,2,3] [4,5,6] => [1,2,3,4,5,6]
append :: [a] -> [a] -> [a]
append l1 l2 = l1 ++ l2


-- write a function called isGreater that takes in two list and returns true if the first element of the
-- first list is greater then the first element fo the second list. If not then returns false. Use typeclasses and
-- generics!!!!!!!!
-- EX: isGreater [1,2,3] [4,5,6]  => False
--     isGreater [4,5,6] [1,2,3]  => True
isGreater :: (Ord a) => [a] -> [a] -> Bool
isGreater l1 l2 = if (head l1) > (head l2)
                        then True
                        else False


-- write a function constructTuple that takes in two values and constructs a tuple from the given values.
-- EX: constructTuple 4 6       => (4,6)
--     constructTuple 'a' 1     => ('a',1)
constructTuple :: a -> b -> (a,b)
constructTuple x y = (x, y)