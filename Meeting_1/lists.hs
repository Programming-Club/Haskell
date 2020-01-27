-- Please review operations.hs first, then functions_intro.hs second!!!
-- NOTICE: All content in this file must be typed into the haskell cmd to work


-- ** Creating lists **
-- to create a list in Haskell use the following syntax.
[1,2,3,4,5,6,7]

-- NOTE: lists are homogenous data structures so the following is not
--  valid.
[1,2,3,"Hello"]     -- error

-- However this is valid
[1,2,3,3.5]         -- This is because float and num extend the same Typeclass
                    --  again we will discuses this more soon





-- *** List concatenation ***
[1,2,3,4,5] ++ [5,6,7,8,9]      -- [1,2,3,4,5,5,6,7,8,9]
[[1,2],[3,4]] ++ [[1,2],[4,5]]    -- [[1,2],[3,4],[1,2],[4,5]]

"Hello" ++ " world!"            -- "Hello world!"
{- IMPORTANT
    Lets take some time to talk about strings. In Haskell string are
      represented as follows:  -}

"Joshua" --String

{- Characters on the other hand are represented as follows:  -}
'J' -- character

{- In Haskell a String is the same thing as a list of characters. So
    "Joshua" is just syntactic sugar for [ 'J', 'o', 's', 'h', 'u', 'a']
-}
 
 ['w','o'] ++ ['o','t']     -- "woot"
 "" == []                   -- True

 -- NOTE: Its import to know that append is more expensive then cons





-- *** Cons ***
5:[1,2,3,4,]        -- [5,1,2,3,4]

-- The : symbol is the same as cons in racket!

1.2:[1,2,3,4]       -- [1.2,1,2,3,4]

'A':"Hello"         -- "AHello"  Notice how we append a character




-- *** Get an element at a specific index ***
"Joshua Schappel" !! 4      -- 'u'
"Marco loves Racket" !! 12  -- 'R'    
"Hi" !! 5                   -- error

let b = [[6,6,6],[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]] 
b !! 2                      -- [5,3,3,3]




-- *** List Ranges ***
-- Note: only Numbers and characters can have ranges 

[1..10]                     -- [1,2,3,4,5,6,7,8,9,10]
[1..]                       -- infinite range PRESS Ctlr + c to stop
[10, 9..1]                  -- [10,9,8,7,6,5,4,3,2,1]

['a'..'z']                  -- "abcdefghijklmnopqrstuvwxyz"






-- *** More useful list functions ***

-- head: takes a list and returns its head (same as car in Racket)
head [1,2,3,4]              -- 1
head "Josh"                 -- 'J'

-- tail: takes a list and returns its tail (same as cdr in Racket)
tail [1,2,3,4]              -- [2,3,4]
tail "Josh"                 -- "osh"
head (tail [1,2,3,4])       -- 2

-- last: takes a list and returns its last element.
last [1,2,3,4]              -- 4
last "Josh"                 -- 'h'

-- init: takes a list and returns everything except its last element
init [1,2,3,4]              -- [1,2,3]
inti [1]                    -- []
init "Joshua"               -- "Joshu"
init "Jo"                   -- "J"

-- length: takes a list and returns its length
length [1,2,3,4,5,6]        -- 6

-- null: checks if a list is empty. 
null []                     -- true
null [1,2,3,4]              -- false
null ""                     -- true

-- reverse: reverses a list.
reverse []                  -- []
reverse [1,2,3,4]           -- [4,3,2,1]
reverse "Joshua"            -- "auhsoJ"

-- take: takes number and a list. It extracts that many elements from the 
--    beginning of the list
take 3 [5,4,3,2,1]          -- [5,4,3]
take 4 "Joshua"             -- "Josh"

-- drop: drops the number of elements from the beginning of a list
drop 3 [8,4,2,1,5,6]        -- [1,5,6]
drop 2 "Hello"              -- "llo"

-- minimum and maximum return the largest or smallest element in a list
minimum [1,2,3,4]               -- 1
maximum [1,2,3,4]               -- 4

-- Elem: takes a value and a list of values and tells us if that value 
--    is an element of the list.
elem 4 [1,2,3,4,5]              -- True
elem 'J' "Josh"                 -- True
elem 'J' "josh"                 -- False

4 `elem` [1,2,3,4]              -- True (elem is usually used as an infix
                                --      function)

-- cycle takes a list and cycles it into an infinite list.
cycle[1,2,3]            -- PRESS Ctlr + c to stop

take 10 (cycle [1,2,3])     -- WAIT WTF!?!?!? why wasn't it infinite?!?
                            --  thats because Haskell is lazy!

{- Lets take a moment to talk about lazy evaluation. Lazy evaluation is a method 
    to evaluate a Haskell program. It means that expressions are not evaluated when
    they are bound to variables, but their evaluation is deferred until their results
    are needed by other computations. In consequence, arguments are not evaluated before
    they are passed to a function, but only when their values are actually used.

    Lets see another example:
-}
take 10 [1..]       -- [1,2,3,4,5,6,7,8,9,10]

{- In this example the list [1..] is only generated after each take is called. So once take 0
    is called and the function finishes the rest of the list is never processed. 

    Lets see one more example: -}

-- repeat takes an element and produces an infinite list of just that element
take 10 (repeat 5)          -- [5,5,5,5,5,5,5,5,5,5]



{- Lazy evaluation can come in handy when processing large lists because one can easily 
    only process a portion of the list avoiding needless computations. Lazy evaluation 
    also makes it possible to define and work with infinite data structures.  
    
    DID YOU KNOW??!?!?!
        Many languages like Java, Python and Racket have a form of lazy evaluation that
         you can use when processing data. Their implementation is very different form 
         Haskell's and we will go into more detail on  the pros and cons of this later on.
         I recommend you choose your favorite language and see how lazy evaluation is 
         implemented in it. 
-}