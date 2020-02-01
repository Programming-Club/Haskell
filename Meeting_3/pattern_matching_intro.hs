{- An Intro to Pattern Matching

By now you have probably heard me tell you that Haskell engenders a different
    way of thinking about programming. To start out we are going to reprogram
    your brain by looking at one of the cornerstones of all programming
    languages -- ASSIGNMENT!


THE BIG 5: 
    There are 5 main languages that use pattern matching. They are:
    1) Rust     => A multi-paradigm system programming language focused on safety, especially safe concurrency
    2) Haskell  => A purely functional programming language with type inference and lazy evaluation
    3) Erlang   => A functional language that is fault-tolerant and deals with high concurrency
    4) Elixir   => An evolution of Erlang mainly used for backend API's
    5) Prolog   => A logic programming language associated with artificial intelligence and computational linguistics

    Other languages have bits and pieces of patten matching like case statements, but they are no where
        near as advanced as what we are about to learn



The = Operator
    Consider to follow code:
    
    a = [1,2,3]

    Most programmers would look at this code and say, "OK, we assign the list [1,2,3] to a
        variable a. In Haskell this type of thinking is WRONG! This is because in Haskell
        the = operator is not an assignment but instead an assertion. It only succeeds if
        Haskell can find a way of making the left-hand side equal to the right-hand side.
        In the case above, the left-hand side is a variable and the right-hand is list, so 
        Haskell can make the match true by binding the variable 'a' to the list [1,2,3].
        Now your probably saying, "wait a second... This is the same as assignment!". But 
        lets take it up a notch

    Type the following in the ghci...
-}
let list = [1,2,3]
list      -- [1,2,3]

-- everything seems normal so far...
let [a,b,c] = list  -- hmm.....
a    -- 1
b    -- 2
c    -- 3

{- Haskell looked for a way to match the left-side of the assertion to the right side. Since
    since the left side is a list containing three variables and the right-side is a list 
    containing 3 values the pattern could be matched!

    lets look at another example
-}

let list = [[1,2],[3,4],[5,6]]
let [a,b,c] = list
a       -- [1,2]
b       -- [3,4]
c       -- [5,6]

-- again Haskell is able to find a match!

let list = [1,2,3]
let [a,b] = list    -- hmm.. no error so far...
a       -- Exception: <interactive>:27:5-16: Non-exhaustive patterns in [a, b]

-- Ahh there is the error. Haskell can not match a list of 2 variables to three values!!!

let list = [1,2,3]
let [a,2,c] = list
a       -- 1
c       -- 3

{- Why did this match work? Well the literal 2 corresponds to the 2 on the so the pattern matches since
    a = 1, 2 = 2, c = 3
-}


let list = [1,2,3]
let [a,3,c] = list   -- hmm... no error?!?!?
a       --  Exception: <interactive>:41:5-18: Non-exhaustive patterns in [a, 3, c]
-- Perfect! 3 does not = 2 so the match does not hold!!



-- we can patten match list by using first and rest
let (x:xs) = [1,2,3,4]
x       -- 1
xs      -- [2,3,4]

-- Notice how we used x for first and xs for rest! This is standard practice in Haskell




-- *** Patten Matching Tuples ***
-- we can also pattern match tuples
let (a,b) = (1, 'c')
a       -- 1
c       -- 'c'








{- OK TIME FOR SOME PRACTICE!!!
    Which of the following matches will hold? And if the pattern does hold 
        what will the values return? I recommend typing them in the ghci for
        practice...
        (Scroll down for answers)

    1) let a = [1,2,3,4]
    2) let [a,b] = [1,2,3]
    3) let a = [[1,2,3]]
    4) let [a] = [[1,2,3]]
    5) let [[a]] = [[1,2,3]]

-}
















{- Answers:
    1) holds    => a returns [1,2,3,4]
    2) does not hold
    3) holds    => a returns [[1,2,3]]
    4) holds    => a returns [1,2,3]
    5) does not hold
-}