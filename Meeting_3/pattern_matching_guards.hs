{- Please review pattern_matching_functions.hs First!!!


Whereas patterns are a way of making sure a value conforms to some 
    form and deconstructing it, guards are a way of testing whether
    some property of a value (or several of them) are true or false.

    Instead of trying to explain this through text lets dive into some 
        examples.

    
    First create a new file called guards.hs . Then type the following:

    
    IMPORTANT!!!!!!!!!
    all code in this file will be written in vscode. to test the code out
    do the following:
    - cd in your cmd to the folder that the file is in
    - type ghci in the cmd
    - type the following:
        :l file_name
    - then you can use the functions loaded from the vscode file...
-}


-- Lets make a function called 'holeScore' that determines how your golf
--  score holds up. holeScore will take in two parameters: score and par
holeScore :: Int -> Int -> String
holeScore strokes par
    | strokes < par = "Under par"
    | strokes == par = "Level par"
    | otherwise = "Above par"

{- Now lets break it down...

1) Guards are indicated by the pipe operator |
2) between the pipe and the equals sign is the conditional
3) After the = is the truth case
4) the last guard is always otherwise. This case means that if all the 
    above guards failed then the otherwise guard will always be true

NOTE: NOTICE THAT WE REMOVE THE = in the function!!!!! holeScore strokes par

So the guard:  | strokes < par = "Under par"  can be read as
If strokes < par then return "Under par" 


Lets do some more:
-}


-- lets write a function max' that returns the max of two values
max' :: (Ord a) => a -> a -> a
max' x y
    | x > y = x
    | otherwise = y



-- lets write a function abs' that returns the absolute value of a number
abs' :: (Num a, Ord a) => a -> a
abs' num
    | num < 0 = -1 * num
    | otherwise = num

-- abs' (-5)        -- 5


-- lets write a function that gets the nth element of a list
--   In order to avoid throwing an error if the user asks for an element
--   outside the bounds fo the List we will use a new type called Maybe

{- What is MAybe?
    Maybe has two possible outputs
        1) Nothing
        2) Just x, where x is a value
    
    Maybe is used to allow programmers to handle errors without having to
    throw an error. consider to following:

    nthElement [1,2,3,4] 2      => Just 3
    nthElement [1,2,3,4] 5      => Nothing (normally this would throw an error)

    OK! so now lets code it
-}

nthElement :: [a] -> Int -> Maybe a
nthElement [] _ = Nothing
nthElement (x:xs) num
    | num == 0 = Just x
    | otherwise = nthElement xs (num - 1)

-- Now it we said nthElement [1,2,3,4] 25   it will return Nothing!
-- Awesome!!!!!