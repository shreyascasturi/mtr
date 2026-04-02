type BookWord = String
type BookTitle = String 
type AuthorName = String 
type NumberOfPages = Int 

data Page = Page [BookWord]
data Pages = Pages [Page]
data Book = Book BookTitle AuthorName NumberOfPages Pages
data BookRow = BookRow [Book]

lengthOfRow :: BookRow -> Int
lengthOfRow [] = 0
lengthOfRow (x:xs) = 1 + (lengthOfRow xs)


fold' :: (a -> b -> b) -> b -> [a] -> b
fold' f acc [] = acc
fold' f acc (x:xs) = (f x (fold' f )

lengthOfRow' :: BookRow -> Int
lengthOfRow 


