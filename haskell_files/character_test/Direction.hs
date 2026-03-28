data Direction = Left | Right | Up | Down

data Move = Move String Direction Int 

newtype MoveSet = MoveSet [Move]

