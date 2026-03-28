-- look at this link for reference. Want to be able
-- to have the time calculator as expression

-- what would I need?
-- I want to parse and determine validity of an expression
-- and then do the operation/evaluation of that expression

-- What are the operations?
-- add and subtract time.
-- let's convert a time to seconds and minutes

-- let's assume that we have:
-- 1. Days,
-- 2. Hours,
-- 3. Minutes,
-- 4. Seconds
-- So I have a 4-tuple that I want to do calculations on.

timeToSeconds :: Int -> Int -> Int -> Int -> Int 
timeToSeconds days hours minutes seconds = 
    (days * 24 * 60 * 60) + (hours * 60 * 60) + (minutes * 60) + seconds


secondsToDaysHours