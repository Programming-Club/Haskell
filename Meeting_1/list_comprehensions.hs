-- Please review lists.hs first!!!
-- NOTICE: All content in this file must be typed into the haskell cmd to work

-- For anyone who has took Discrete Math or is taking PL or Formal with Marco this
--   will feel familiar.




-- *** List Comprehensions ***
-- A list comprehension is Haskell's way of building set comprehension.
-- What is a Set comprehension you ask? Well see the example below
---   EX: S = { 2*x | x N, x <= 10}
--       The above means that the Set S contains the  first ten even natural
--         numbers. (Any number *2 will always be even)
-- To write this in code we do the following:

[x*2 | x <- [1..10]]                    -- [2,4,6,8,10,12,14,16,18,20]

-- We can also add conditions to our list comprehension.
-- lets get the first ten even numbers, but only return the ones >=12
[x*2 | x <- [1..10], x*2 >= 12]         -- [12,14,16,18,20]


-- Let get all the odd numbers from 0 to 100
[x | x <- [0..100], odd x]              -- [1,3,5,7,9,11,13,15, ...]


-- Lets get all number from 10 to 20 and exclude 14, 16, 18
[x | x <- [10..20], x/=14, x/=15, x/=18]    -- [10,11,12,13,16,17,19,20]

-- Notice how we use a , to separate conditions


-- We can also use multiple predicates and lists
[x + y | x <- [1..3], y <- [1..3]]          -- [2,3,4,3,4,5,4,5,6]
-- How does this work? well it does [1+1, 1+2, 1+3, 2+1, 2+2, 2+3 ...]

let firstNames = ["Joshua", "Ajay", "Justin", "Hans", "John", "Sachin", "Anthony", "Sean", "Davis"]
let lastNames = ["Schappel", "Shah", "Tom", "Yabao", "Murzaku", "Mahashabde","Mauro", "King", "Cook"]

[x ++ " " ++ y | x <- firstNames, y <- lastNames]  -- ["Joshua Schappel","Joshua Shah","Joshua Tom" ...]


-- lets make a function that removes all uppercase letters using list comprehensions
removeUppers word = [x | x <- word, x `elem` ['a'..'z']]

removeUppers "HellO WORlD"              -- "elll"


{- You do not always have to use list comprehensions, but it is another tool that you can use
    to make you life easier. They can also cut down on code line and help with code readability

    If you need another explanation try here: http://learnyouahaskell.com/starting-out
-}

