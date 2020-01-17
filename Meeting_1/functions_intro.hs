-- Please review operations.hs first!!!
-- NOTICE All content in this run must be typed into the haskell cmd

-- *** Functions ***
-- Ok this is going to be pretty weird at first but just give it some time
--   after all you guys did like rackets syntax after a while right... ;)


-- lets make a function that doubles a number. 
doubleNumber x = x + x
doubleNumber 4          -- 8

{-|  Now lets see whats going on here:
        1) doubleNumber is the name of the function
        2) x is the parameter it takes 
        3) = means that the body of the function comes next
        4) x + x takes the x value and adds it to its self
        *Notice how we don't need a return statement. The last line is
            always the returned value
-}


-- We can call nested functions
doubleNumber (doubleNumber 4)          -- 16

-- A function that triples a number
tripleNumber x = x + x + x
tripleNumber 2               -- 6


-- We can use math operators with functions...
doubleNumber 4 + tripleNumber 2         -- 14


-- ** functions with multiple parameters **
-- Lets multiply two numbers!!!
mult x y = x * y
mult 3 4        -- 12

-- Ahh so like Racket we use a space to separate parameters not a , link 
--      in java


-- FUNCTIONS ON TOP OF FUNCTIONS!!!!!
-- in function programming we try to reduce functions into there simplest
--    form and then build more complex functions off of them.

-- Lets make a function called squareUs that takes in two numbers and 
--   returns the sum of the numbers squared. So squareUs 2 4 returns 20
--   since 2^2 = 4 and 4^2 = 16, 4 + 16 = 20
squareNum x = x * x -- i know we could just use ^ but bare with me here...
squareUs x y = squareNum x + squareNum y

squareUs 2 4            -- 20    HURRAY!!!




-- ** Predefined functions ** 
-- Here are some handy functions

min 9 10        -- 9
min 3.2 3.1     -- 3.1
max 5 6         -- 6
max 100.1 2.234 -- 100.1

succ 8          -- 9 

--  there are plenty more we will cover later on..



-- ** Conditionals **
-- Guess what you will hardly ever use them and I encourage you to try to
--   only use them when necessary. But how can this be... Be patient you 
--   will fnd out later on...


-- lets make a function that doubles a number if it is less then 100,
--  but halves a number if greater then 100.

doubleHalf x = if x > 100 then x / 2 else x * 2
doubleHalf 4        -- 8
doubleHalf 4.5      -- 9.0
doubleHalf 120      -- 60.0


-- Important: We can turn the above conditional into multiple lines if
--   we use a Haskell file (we will do this later on). This is how it would
--   look
doubleHalf x = if x > 100 
                    then x / 2 
                    else x * 2
-- Ohhh much cleaner!

-- NOTE: indentation matters!!! the following will not work!!!
doubleHalf x = if x > 100 
    then x / 2 
    else x * 2


-- but this will..
doubleHalf x = 
    if x > 100 
        then x / 2 
        else x * 2

-- In fact this is the 'proper form'!!!!!!!


-- We can next conditionals
-- This function will do the same as above but add one to the final answer
doubleHalf' x = (if x > 100 then x / 2 else x * 2) + 1
doubleHalf' 4        -- 9.0
doubleHalf' 4.5      -- 10
doubleHalf' 120      -- 61

-- **NOTE: The ' symbol. This means that the function is a slightly modified
--      version of a function with the same name. It also can be use to 
--      denote a strict function (one that isn't lazy). But what is a lazy
--      function?!?!?!?! DON'T WORRY WE WILL GET TO THAT LATER!!!!
