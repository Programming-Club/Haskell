-- NOTICE: All content in this file must be typed into the haskell cmd to work

-- We have briefly talked about types earlier on in our tutorials, but now
--   we are going to go more in-depth. Types are a very IMPORTANT part of Haskell
--   because Haskell is a strongly typed language.

-- in the ghci type the following:
:set +
-- The command that we just used tells the ghci that after every expression to
--   return the expression type to us, so we can see exactly what types are being
--   returned.

-- now lets do some examples type the following and press enter:
'c'               -- it :: Char

-- What does it :: Char mean? Well first lets look at the general form:
--    - x :: y  This says that the expression x is type y.
--    - now going back to, it :: Char we can read it as the expression
--         'it' is type Char.

-- let try some more!!!!
"SHU"           -- it : [Char]    is read: the expression 'it' is an 
                --      array of type char. Remember Strings are an 
                --      array-of-characters!!!!


-- **IMPORTANT**
-- it is a very handy ghci feature. 'It' lets use use the result of the 
--   expression we just evaluated and use it in a new expression. EX:
"Josh"                  -- it :: [Char]
it ++ " Schappel"       -- "Joshua Schappel"  it :: [Char]


5 == 5               -- it :: Bool
5.5 * 6              -- it :: Fractional a => a (ignore to a => a for now)
5                    -- it :: Num p => p (again ignore p => p)






-- *** Type signatures ***
{- Now lets finally do some coding in VS Code. WOOHOO!!! Here is what we
    need. First create a folder on your pc called Haskell and then open
    that folder in VS Code of your text editor of choice. Now crate a new
    file called first.hs. (I recommend downloading the Haskell Syntax 
    highlighting VS Code extension). 

    Now we need to exit out of the cmd and re-open it. cd to the Haskell
    FOLDER, not file, you just made and type ghci.

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

add 4 5         -- 9

-- lets now look at the type signature of add we can type the following
--   into the ghci:
t: add              -- add :: Num a => a -> a -> a

{- Wow! Haskell was smart enough to figure out the type signature for us.
    But what does this actually mean? Well lets try to make our own 
    signature first. Type the following in fist.hs
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

{-  The function can be read addThree takes in a int, int, int and returns
        a int. 

        **NOTE: The last type is always the return type!!!!!!!!!!**

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