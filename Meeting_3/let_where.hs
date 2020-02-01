{- Please review pattern_matching_guards.hs First!!!


    
    First create a new file called wl.hs . Then type the following:

    
    IMPORTANT!!!!!!!!!
    all code in this file will be written in vscode. to test the code out
    do the following:
    - cd in your cmd to the folder that the file is in
    - type ghci in the cmd
    - type the following:
        :l file_name
    - then you can use the functions loaded from the vscode file...
-}


{- Consider our previous function holeScore -}
holeScore :: Int -> Int -> String
holeScore strokes par
    | strokes < par = "Under par"
    | strokes == par = "Level par"
    | otherwise = "Above par"


-- Now lets have holeScore return the number of strokes the player was
--  under or over par

holeScore' :: Int -> Int -> String
holeScore' strokes par
    | strokes < par = show (par - strokes) ++ " under par"
    | strokes == par = "Level par"
    | otherwise = show (strokes - par) ++ " over par"

-- **NOTICE: we can use show to convert a Int to a string!!!!!!


{- The above function works, but it can be a bit hard to understand
    with the math calculations in the guards. This is where the 'where'
    clause comes in. The where clause comes after the guards and the 
    guards have access to all variables defined in the where. 
    
    Now lets rewrite the function
-}
holeScore'' :: Int -> Int -> String
holeScore'' strokes par
    | strokes < par = show (abs score) ++ " under par"
    | strokes == par = "Level par"
    | otherwise = show score ++ " over par"
    where score = strokes - par

-- See how we put the calculation in the where clause.. Cool!!!
-- let do another

--  Lets make a BMI calculator
bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
    | weight / height ^ 2 <= 18.5 = "You're underweight"  
    | weight / height ^ 2 <= 25.0 = "You're normal"  
    | weight / height ^ 2 <= 30.0 = "You're overweight"  
    | otherwise = "You're very overweight" 


-- we can take advantage for the where clause here
bmiTell' :: (RealFloat a) => a -> a -> String
bmiTell' weight height
    | bmi <= 18.5 = "You're underweight"  
    | bmi <= 25.0 = "You're normal"  
    | bmi <= 30.0 = "You're overweight"  
    | otherwise = "You're very overweight" 
    where bmi = weight / height ^ 2


-- We can also patten match in where clauses
-- let write a function that returns someones initials
initials :: String -> String -> String
initials firstName lastName = [f] ++  ". " ++ [l] ++ "."
    where (f:_) = firstName
          (l:_) = lastName


describeList :: [a] -> String  
describeList xs = "The list is " ++ what xs  
    where what [] = "empty."  
          what [x] = "a singleton list."  
          what xs = "a longer list."  






{- let
    
    Let is similar to where however lets can be defined any where and
    are very local, meaning they cannot span across guards.
    
-}

cylinder :: (RealFloat a) => a -> a -> a  
cylinder r h = 
    let sideArea = 2 * pi * r * h  
        topArea = pi * r ^2  
    in  sideArea + 2 * topArea


-- Splits a string by its space. Only 1 space can be in the
--   string for this to work
splitBySpace :: [Char] -> ([Char], [Char])
splitBySpace aString = 
    let lhs = takeWhile (/= ' ') aString
        (x:rhs) = dropWhile (/= ' ') aString
    in (lhs, rhs)

