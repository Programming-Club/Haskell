-- NOTICE: All content in this file must be typed into the haskell cmd to work


-- *** TUPLES ***

{- So what is a Tuple? Well tuples are like lists because they allow you to store several values
    however, there are a few BIG differences. Tuples, unlike lists, allow you to store multiple
    data-types. For instance a List of Integers is always a list of integers while a tuple can be
    a tuple of integer and string... Its a bit confusing to write out so ill show you some examples.

    Type the following in the ghci
-}

let aList = [1,2,3,4,5,6]
:t aList                    -- aList :: Num a => [a]

let sList = [1,"Josh"]      -- ERROR This an error because a list can only be a list of a SINGLE data-type


-- Now lets try with a tuple. We denote a tuple with ( )

let myFirstTuple = (1,"Josh")   -- myFirstTuple :: Num a => (a, [Char])

{- Well would you look at that! Using a tuple we can add multiple types! Lets see some more 
     examples!
-}

let t1 = ("Hello", 23.3, True)  -- t1 :: Fractional b => ([Char], b, Bool)
:t t1

let tupleList = [(1,"Josh"), (2,"John"), (3,"Sam")] -- tupleList :: Num a => [(a, [Char])]
:t tupleList


let listOfListOfInts = [[1,2,3], [1,2,3,4], [1,2,3]]
:t listOfListOfInts             -- listOfListOfInts :: Num a => [[a]]

let listOfTuples =  [(1,2,3), (1,2,3,4), (1,2,3)] -- ERROR
{- What happened here!!!!! Well for listOfListOfInts Haskell has no problem because its a 
    list of list of ints. But for the listOfTuples Haskell complains because the list must 
    be a list of tuples, where each tuple is a tuple of 3 ints, not 4!!!!!

    For this reason we must use Tuples only when we know in advanced how many components 
      we have. Now lets look at some functions we can do on tuples.
-}



-- *** FUNCTIONS ON TUPLES ***
fst (11, 5)             -- 8 (This is just like head on lists)
fst("Josh", 55)         -- "Josh"

snd (11,5)              -- 5
snd (55, "Josh")        -- "Josh"

-- *** NOTE: fst and snd will only work on pairs they will not work on triples and up...

--zip: takes in two lists and then zips them together into one list by joining the matching
--  elements in pairs.
:t zip          -- zip :: [a] -> [b] -> [(a, b)]
zip [1,2,3,4,5] [5,5,5,5,5]     -- [(1,5),(2,5),(3,5),(4,5),(5,5)]
zip [1 .. 5] ["one", "two", "three", "four", "five"]    -- [(1,"one"),(2,"two"),(3,"three"),(4,"four"),(5,"five")]

-- lets try with lazy evaluation!!!
take 5 (zip [1..] ['a'..'z'])       -- [(1,'a'),(2,'b'),(3,'c'),(4,'d'),(5,'e')]


-- We can also use Tuples in list comprehensions

-- let print all possible triangles
let triangles = [ (a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10] ]



-- For more info on tuples: http://learnyouahaskell.com/starting-out#tuples