type ProtonCount = Int
type ElectronCount = Int 
data Element = Element ProtonCount ElectronCount

type XCoord = Int
type YCoord = Int
data Atom = Atom XCoord YCoord

getAtomicWeight :: Element -> Int
getAtomicWeight (Element x y) = x + y


getAtomicXCoord :: Atom -> XCoord
getAtomicXCoord x =
    case x of
        Atom x_coord y_coord -> x_coord


    