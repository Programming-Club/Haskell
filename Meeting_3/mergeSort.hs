
-- Sorts a list using the merge sorting algorithm starting with
--  the list already in its simplest form EX:
--  [1,2,3,4] -> [[1],[2],[3],[4]]
mergeSort :: (Ord a) => [a] -> [a]
mergeSort [] = []
mergeSort xs = 
    let singleEleList = map(\ x -> [x]) xs
    in mergeRecursive singleEleList


-- Sorts a list using the merge sorting algorithm starting with
--  the list needs to first be broken down into its simplest form
mergeSort' :: (Ord a) => [a] -> [a]
mergeSort' [] = []
mergeSort' [x] = [x]
mergeSort' l = mergePair (mergeSort' firstHalf) (mergeSort' secondHalf)
    where firstHalf = take ((length l) `div` 2) l
          secondHalf = drop ((length l) `div` 2) l







-- Continues to merge pairs until there is only one element left in the
--   list, in which case that element is returned since it is the sorted
--   list.
mergeRecursive :: (Ord a) => [[a]] -> [a]
mergeRecursive l1
    | length l1 == 1 = head l1
    | otherwise = mergeRecursive . mergeAllElements $ l1

-- combines all pairs in a list, where each pair is a sorted list
mergeAllElements :: (Ord a) => [[a]] -> [[a]]
mergeAllElements [] = []
mergeAllElements (x:y:xs) = (mergePair x y): mergeAllElements xs
mergeAllElements (x:xs) = x:mergeAllElements xs


-- Merges a pair of elements together into a new list, where the new list is
--   in sorted order
mergePair :: (Ord a) => [a] -> [a] -> [a]
mergePair [] l2 = l2
mergePair l1 [] = l1
mergePair l1 l2
    | x > y = y:mergePair l1 ys
    | otherwise = x:mergePair xs l2 
    where (x:xs) = l1
          (y:ys) = l2


