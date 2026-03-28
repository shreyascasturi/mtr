-- While lang

-- S = statements
-- a = arithmetic exprs
-- x,y = prog vars
-- n = num literals
-- P = boolean predicates

-- a = arithmetic exprs
-- a = x | n | a1 op_a a2
-- op_a = + | - | * | /

-- I want there to be
-- LiteralNumType = IntLiteral Int | FloatLiteral Float
-- LiteralBoolType = TrueLiteral | FalseLiteral
-- BoolExpr = LitBool LiteralBoolType | NotExpr BoolExpr | ArithCompExpr ArithExpr ArithExpr BoolArithOpCode

-- ArithExpr = Var (String) | LitNum LiteralNumType | ArithExprRec ArithExpr ArithExpr ArithOpCode
-- 
--import Data.Map.Strict as Map
--import Data.Maybe as Maybe

-- an arith expr is either:
-- 1. a variable, 
-- 2. a num literal, 
-- 3. two arith exprs with op code.
data ArithExpr = VarExpr Var
                | NumLiteral Int 
                | ArithExprRec ArithExpr ArithExpr ArithOpCode

instance Show ArithExpr where
    show (VarExpr x) = show x
    show (NumLiteral x) = show x
    show (ArithExprRec a1 a2 a_op) = "[" ++ show a1 ++ show a_op ++ show a2 ++ "]"

-- -- arith op codes are standard ops
data ArithOpCode = Plus 
                | Subtract 
                | Mul 
                | Div
instance Show ArithOpCode where
    show Plus = " + "
    show Subtract = " - "
    show Mul = " * "
    show Div = " / "

-- -- bool exprs are either:
-- -- 1. true/false literals
-- -- 2. an expression comparing the results of two arithmetic expressions
-- -- 3. a not-expression (negating the value of a bool expression)
-- -- 4. the result of two boolean expressions evaluated with a boolean operation
data BoolExpr = TLiteral 
                | FLiteral 
                | ArithCompExpr ArithExpr ArithExpr BoolArithOpCode
                | NotExpr BoolExpr
                | BoolExprRec BoolExpr BoolExpr BoolOpCode
instance Show BoolExpr where
    show (TLiteral) = " true "
    show (FLiteral) = " false "
    show (ArithCompExpr a1 a2 b_a_op) = "[" ++ show a1 ++ show b_a_op ++ show a2 ++ "]"
    show (NotExpr b1) = "not(" ++ show b1 ++ ")"
    show (BoolExprRec b1 b2 b_op) = "[" ++ show b1 ++ show b_op ++ show b2 ++ "]"

-- -- bool arith op codes are standard comparison ops between ints
data BoolArithOpCode = Le 
                | Lequal 
                | Equal 
                | Ge 
                | Gequal
instance Show BoolArithOpCode where 
    show Le = " < "
    show Lequal = " <= "
    show Equal = " == "
    show Ge = " > "
    show Gequal = " >= "

data BoolOpCode = And | Or
instance Show BoolOpCode where
    show And = " && "
    show Or = " || "

type Var = String

type Store = Map Var ArithExpr

data Stmt = Assign Var ArithExpr | Skip | Seq Stmt Stmt | IfThenElse BoolExpr Stmt Stmt | WhileLoop BoolExpr Stmt


-- -- -- EVALUATION CODE 
evalStmt :: Store -> Stmt -> Store
evalStmt store (Assign var a_expr) = Map.insert var a_expr store
evalStmt store (Skip) = store
evalStmt store (Seq stmt1 stmt2) = let firstUpdatedStore = evalStmt store stmt1
                                    in evalStmt firstUpdatedStore stmt2
evalStmt store (IfThenElse b_expr stmt1 stmt2) = if (evalBoolExpr b_expr) 
                                                then (evalStmt store stmt1) 
                                                else (evalStmt store stmt2)
evalStmt store (WhileLoop b_expr stmt) = if (evalBoolExpr b_expr) then
                                            let updatedStore = evalStmt store stmt
                                            in evalStmt updatedStore (WhileLoop b_expr stmt) 
                                         else store

evalBoolExpr :: Store -> BoolExpr -> Bool
evalBoolExpr _ (TLiteral) = True
evalBoolExpr _ (FLiteral) = False
evalBoolExpr store (ArithCompExpr a1 a2 b_a_op) = evalArithBoolExpr store a1 a2 b_a_op
evalBoolExpr store (NotExpr b_expr) = not (evalBoolExpr store b_expr)
evalBoolExpr store (BoolExprRec b1 b2 And) = (evalBoolExpr store b1) && (evalBoolExpr store b2)
evalBoolExpr store (BoolExprRec b1 b2 Or) = (evalBoolExpr store b1) || (evalBoolExpr store b2)

evalArithBoolExpr :: Store -> ArithExpr -> ArithExpr -> BoolArithOpCode -> Bool
evalArithBoolExpr store a1 a2 Le = (evalArithExpr store a1) < (evalArithExpr store a2)
evalArithBoolExpr store a1 a2 Lequal = (evalArithExpr store a1) <= (evalArithExpr store a2)
evalArithBoolExpr store a1 a2 Equal = (evalArithExpr store a1) == (evalArithExpr store a2)
evalArithBoolExpr store a1 a2 Ge = (evalArithExpr store a1) > (evalArithExpr store a2)
evalArithBoolExpr store a1 a2 Gequal = (evalArithExpr store a1) >= (evalArithExpr store a2)

evalArithExpr :: Store -> ArithExpr -> Int
evalArithExpr store (VarExpr x) = evalArithExpr store (Maybe.fromJust (Map.lookup x store))
evalArithExpr _ (NumLiteral x) = x
evalArithExpr store (ArithExprRec expr1 expr2 Plus) = (evalArithExpr store expr1) + (evalArithExpr store expr2)
evalArithExpr store (ArithExprRec expr1 expr2 Subtract) = (evalArithExpr store expr1) - (evalArithExpr store expr2)
evalArithExpr store (ArithExprRec expr1 expr2 Mul) = (evalArithExpr store expr1) * (evalArithExpr store expr2)
evalArithExpr store (ArithExprRec expr1 expr2 Div) = (evalArithExpr store expr1) `div` (evalArithExpr store expr2)

-- type Parser a = String -> Maybe (String, a)
-- whileParser :: Parser 
-- test expr prog:
-- store = {"a" : 5, "b" : 17}
-- eval([(a + 19) > (b + 17)])
-- store = Map.fromList[("a", (NumLiteral 5)), ("b", (NumLiteral 17))]
-- (a + 19) > (b + 17)
-- testArithBoolExpr = ArithCompExpr (ArithExprRec (VarExpr "a") (NumLiteral 19) (Plus)) (ArithExprRec (VarExpr "b") (NumLiteral 17) (Plus)) Ge
-- result = evalBoolExpr store testArithBoolExpr


-- overall test program:
-- {"a" : 5, "b": 7}
-- while (a > 0) {
        -- b = b + 1
-- }
-- final output: {"a" : 0, "b" : 12}

-- actual prog
-- prog = Seq (
--                (Assign "a" (NumLiteral 5)) 
--                (Seq 
                    -- (Assign "b" (NumLiteral 7)) 
                    -- (WhileLoop (expr) (Assign "b" ))
                -- )
        --)
-- (Assign "a" (NumLiteral 5)) (Seq (Assign "b" (NumLiteral5)) WhileExpr ())
-- 