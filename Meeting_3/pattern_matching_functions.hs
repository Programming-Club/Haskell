{- Please review pattern_matching_into.hs First!!!

So we have gone over types, typeclasses, functions, and now pattern matching.
    Thats means it finally time to start coding!!!

Create a new file in VS Code called baby.hs and lets type the following
    in the file


Note to try out these functions cd int the command prompt to the fold that this file 
    is saved in and then open the ghci. Or just open a Terminal in VS Code!! 
    Then type the following:
    
    :l baby.hs

    if you edit this file you must reload using the above command!!!!
-}


-- *** PATTERN MATCHING IN FUNCTIONS *** 

-- lets write the classic recursive example in Haskell. FACTORIAL!!!
--      Normally you would write it like this

factorial :: (Num a, Eq a) => a -> a
factorial num = if num == 0
                    then 1
                    else num * factorial (num - 1)


-- however with pattern matching we can instead do this:
factorial' :: (Num a, Eq a) => a -> a
factorial' 0 = 1
factorial' num = num * factorial' (num - 1)

{- We learned a few things from the above example:
    1) functions are Polymorphic
    2) We can use patten matching in parameters

    So now lets break the above example down. So for the first part (right below the data definition)
        we are saying that if the variable passed in we return 0. For the second part we are saying 
        call return the sum of num * factorial' with num-1 
-}


-- lets write a function to reverse a list using patten matching
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

-- remember (x:xs) is used to match a list



-- lets write a function that adds an element n times in a list
addNTimes :: a -> Int -> [a]
addNTimes ele 0 = []
addNTimes ele num = ele:addNTimes ele (num - 1)



-- lets write a function that adds two vectors together (A vector is a tuple)
addVectors :: (Num a) => (a,a) -> (a,a) -> (a,a)
addVectors a b = (fst a + fst b, snd a + snd b)

-- we can do better with our pattern matching though!!!
addVectors' :: (Num a) => (a,a) -> (a,a) -> (a,a)
addVectors' (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- ohh much more readable



-- we can use fst and snd with tuples but not triples.... lets add this
--   functionality
first :: (a,b,c) -> a
first (x, _, _) = x

second :: (a,b,c) -> b
second (_, y, _) = y

third :: (a,b,c) -> c
third (_, _, z) = z

{- Whats up with the _ ????
    Well in haskell if we aren't using a parameter we use _ as a placeholder allowing
        us to not need to initialize the variable. It also keeps the code more readable
-}

