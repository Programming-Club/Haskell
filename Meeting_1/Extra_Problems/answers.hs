-- *** Basic Functions ***

-- write a function, multThree, that multiplies 3 numbers together
multThree x y z = x * y * z


-- write a function, concat, that combines two string together
concat x y = x ++ y


-- write a function, lessGreater, that takes in a number and returns "LESS" if
--   the number is < 100 and returns "GREATER_EQUAL" if <= 100
lessGreater x = if x < 100 then "LESS" else "GREATER_EQUAL"




-- ** LISTS **

-- Assuming that a list is greater then length 3 return the second element in the list
getSecond xs = head (tail xs)


-- Assuming that a list is greater then length 3, write a function that takes in 2 lists
--   and returns true if the first elements of both lists match. If they do not return
--   False
areEqual xs ys = (head xs) == (head ys)


-- Given a list if length then return the first 4 elements (hint: there is a built in
--   function for this...)
take 4 [1,2,3,4,5,6,7,8,9,10]


-- Create a list from 1 - 10 with as little code as possible
[1..10]






-- ** List Comprehensions **

-- Return the first ten numbers (1-10) squared.
-- EX: [1,4,9,16,25,36,49,64,81,100]
[ x*x | x <- [1..10]]
-- or
take 10 [x * x | x <- [1..]]


-- return the numbers between 1 - 10 where a number mod 2 = 0
-- EX: [2,4,6,8,10]
[x | x <- [1..10], x `mod` 2 == 0]


-- create a function, getEven, that takes in a number (x) and returns the first x positive number 
--  of even numbers. 
-- EX: getEven 5   => [2,4,6,8,10]
--     getEven 10  => [2,4,6,8,10,12,14,16,18, 20]
-- ** Hint we need to use lazy initialization!!!

getEven x = take x [a | a <- [1..], even a]