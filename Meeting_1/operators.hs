-- NOTICE: All content in this file must be typed into the haskell cmd to work
-- To open The haskell cmd do the following
--   1) open Command prompt (or terminal on windows)
--   2) type: ghci
--      ** If the above did not work email me!!!!!! **

-- *** Addition ***
2 + 15          -- 17
3 * 4           -- 12
5 * 2 + 3       -- 13
4 / 5           -- 0.8
4^2             -- 16 (^ is the exponent operator)
4^3             -- 64 (AKA 4 cubed)

(4 * 10 ) - 40  -- 0


-- *** Boolean logic ***

-- And
True && False   -- False
False && False  -- False

-- OR
True || False   -- True
False || False  -- False

-- NOTE: While some languages treat 0 and 1 as a boolean Haskell does not!
True || 1       -- Error


-- Equality
1 == 1          -- True
"Josh" == "Sam" -- False
2 < 3           -- True
5 <= 2.3455     -- False
2 /= 3          -- True (Note /= means not equal and represents ≠ in math)

not True        -- False (not is negation)
not False       -- True


-- ** Info **
-- To get info about a operator type :info <operator>
:info + -- we will go in more depth about this in the meeting


-- ** Undefined Values **
pi              -- 3.141592653589793


-- ** Using Assignment in ghci **
-- Note: let in gchi is different from let in a Haskell program... more
--          on that later...
let x = 5
x               -- 5
let y = 4.5
x /= y          -- True

let z = 2
x^z             -- 25

let z = 2.5
x^z             -- Error   WAIT WFT!!!!!!!
-- so it turns out that the ^ operator only works on whole numbers so
--    to rase a number to a floating point we use ** (EWWWWWWWW thats ugly...)

x ** z          -- 55.90169943749475    Much better :-)



-- was this confusing. Here is another explanation: http://learnyouahaskell.com/starting-out