-- lambda calculus types
-- Vars -> strings that denote variables, such as "x", "y", "z", etc...
-- Abs -> abstraction, consisting of a variable and a lambdaTerm (x.[term])
-- App -> application, consisting of (t s)

type Var = String
data LambdaExpr = VarExpr Var | Abs Var LambdaExpr | App LambdaExpr LambdaExpr

-- evaluator code
evalLambdaExpr :: LambdaExpr -> 
