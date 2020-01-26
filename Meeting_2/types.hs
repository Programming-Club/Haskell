
-- We have briefly talked about types earlier on in our tutorials, but now
--   we are going to go more in-depth. Types are a very IMPORTANT part of Haskell
--   because Haskell is a strongly typed language.

{- Before we begin, lets talk about what makes Haskell different from other strongly typed
    languages like Java. In java we must always specify the type of the variable when 
    declaring it, while Haskell uses TYPE INFERENCE, which means it can usually guess the type
    trying to be used. Lets look at some examples. Consider our add function

    Java:
    public int add(int num1, int num 2){
        return num1 + num 2
    }

    In the code above we had to tell Java that both the parameters MUST be of type int.

    Haskell:
    add num1 num2 = num1 + num2

    For the Haskell example lets look at the add functions type. Type the following in the ghci
    (don't forget to first type the add function!!!)

    :t add      -- add :: Num a => a -> a -> a
    
    WOW it added the type signature for us!!! This is what Type inference is. I dont expect you 
    to know what "add :: Num a => a -> a -> a" means. Dont worry we are going to talk about it now!

-}





-- in the ghci type the following:
:set +
-- The command that we just used tells the ghci that after every expression to
--   return the expression type to us, so we can see exactly what types are being
--   returned.

-- now lets do some examples type the following and press enter:
'c'               -- it :: Char

-- What does "it :: Char" mean? Well first lets look at the general form:
--    - x :: y  This says that the expression x is type y.
--    - now going back to, it :: Char we can read it as the expression
--         'it' is type Char.

-- let try some more!!!!
"SHU"           -- it : [Char] is read: the expression 'it' is an array of characters

True            -- it :: Bool  is read 'it' is of type boolean

-- **IMPORTANT**
-- it is a very handy ghci feature. 'It' lets use use the result of the 
--   expression we just evaluated and use it in a new expression. EX:
"Josh"                  -- it :: [Char]
it ++ " Schappel"       -- "Joshua Schappel"  it :: [Char]

5                       -- it :: Num p -> p
it + 5                  -- 10 

5 == 5               -- it :: Bool
5.5 * 6              -- it :: Fractional a => a (ignore to a => a for now)
5                    -- it :: Num p => p (again ignore p => p)






-- *** Type signatures ***
{- Now lets finally do some coding in VS Code. WOOHOO!!! Here is what we
    need. First create a folder on your pc called Haskell and then open
    that folder in VS Code of your text editor of choice. Now crate a new
    file called first.hs. (I recommend downloading the Haskell Syntax 
    highlighting VS Code extension). 

    Now we need to exit out of the cmd and re-open it. cd to the HASKELL
    FOLDER (not the file you just made) and type ghci.

    Then in the file first.hs type the following:
-}

-- lets make a function that adds two numbers
add x y = x + y

-- then in ghci type :l first.hs  (:l stands for load). If the above steps
{- were done properly you will see:
        [1 of 1] Compiling Main             ( first.hs, interpreted )
        Ok, one module loaded.

    Then in ghci type: 
-}
t: add              -- add :: Num a => a -> a -> a
-- as discussed earlier, Haskell used type inference to add the function types

add 4 5         -- 9
add 7.5 6       -- 13.5


-- But what if we wanted to restrict our add function to only integers... Back in the 
--  first.hs file replace add with the following. 

add :: Int -> Int -> Int
add x y = x + y

-- Then reload the file in the ghci (:l first.hs) and type
add 4 5         -- 9
add 7.5 6       -- ERROR


{- Perfect! So what exactly does this line mean: "add :: Int -> Int -> Int"

    Well lets read it left to right. Add takes in an int and an int and returns an int.
    
    NOTE: The last dataType is ALWAYS the return type and the datatypes before the last are
    ALWAYS the parameters.

-}


-- Lets make a function multByTwo that takes a Int and multiples it by 2
multByTwo :: Int -> Int
multByTwo x = x * 2


{- What does this line mean multByTwo :: Int -> Int?
    It means multByTwo has a parameter of type Int and the function
    returns type Int.

    load up the file in ghci again and type the following into ghci.
-}

multByTwo 2         -- 4
multByTwo 2.2       -- error Ahhh. 2.2 is type Fractional but the function
                    --  needs type Int. (You can type: :t 2.2 to see the type)


-- now lets make a function addThree that adds three numbers. back in first.hs
--  do:
addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

{-  The function can be read addThree takes in a int, a int, a int and returns
        a int. 

        **Remember: The last type is always the return type!!!!!!!!!!**

    Now load it in the ghci and type
-}

addThree 10 15 3        -- 28

-- lets write a few more functions
circumference :: Float -> Float  
circumference r = 2 * pi * r  

circumference 2.0         -- 12.566371


circumference' :: Double -> Double  
circumference' r = 2 * pi * r

circumference' 2.0        -- 12.566370614359172


-- Double has twice the precision! 



-- for more info on types: http://learnyouahaskell.com/types-and-typeclasses#believe-the-type