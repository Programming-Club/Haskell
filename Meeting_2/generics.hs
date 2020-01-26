{- PLEASE REVIEW types.hs FIRST!!!!!

Like all strongly typed languages, Haskell has Generic types. Generic
    types allow you to write general methods that work on different types.
    This allows for code reuse!!!


In Haskell we call generic types "Type Variables", and we call functions that
    take in type variables as parameters "Polymorphic functions".


A Type Variable is denoted by a lower case letter in Haskell


Lets take a look:
    type the following in the ghci
-}

-- remember the function head which when given a list returns the first element?
head [1,2,3,4,5]        -- 1
:t head                 -- head :: [a] -> a

{- What the hell is [a] -> a ?!?!?!?!?!?!?!

    a is a Type Variable (aka: Generic). This means that a can be
    ANY type. This is why head can work on list of ints, string, booleans, ect...

    lets look at another example:
-}

-- fst returns the first element of a pair (tuple)
fst ("Josh", 12)        -- "Josh"
:t fst                  -- fst :: (a, b) -> a

{- fst has two type Variables!!!!!! 

In the example above fst take in a tuple of types a and b and returns
    type a because type a is the first element of the tuple.




    Lets write our own examples in VS Code!!!
    Now crate a new file called second.hs.

    Exit out of the cmd and re-open it. cd to the HASKELL
    FOLDER (not the file you just made) and type ghci.

    Then in the file second.hs type the following:
-}

-- lets write our own head function called first. First will take in a 
--   list and return the first element of that list
first :: [a] -> a
first list = head list

-- load it into ghci by typeing :l second.hs
-- then type

first [1,2,3,4]                     -- 1
first ['j', 'o', 's', 'h']          --'j'


-- I know this file is very short be we will dive even deeper into 
--   type values later when we get to pattern matching. The important thing
--   for now it to know that they exist


-- for more info: http://learnyouahaskell.com/types-and-typeclasses#type-variables