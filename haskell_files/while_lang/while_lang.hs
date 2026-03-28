import Data.Map.Strict as Map
import Data.Maybe as Maybe

-- Operators for various expressions --
data ArithOp = Plus 
                | Minus 
                | Mul 
                | Div

data BoolCompOp = Le 
                | Leq
                | Equal
                | Geq
                | Ge

data BoolOp = And | Or

-- Numeric and Boolean types (literal values) --
data NumLiteral = FloatLiteral Float | IntLiteral Int

data BoolLiteral = TrueLiteral | FalseLiteral

-- Variables (these are strings that function as keys to a store(s)) --
type Var = String 

-- General Expressions as Types --
data ArithExpr = VarExpr Var 
                | NumLit NumLiteral 
                | AREx ArithRecExpr

data ArithRecExpr = ARExpr ArithExpr ArithExpr ArithOp

data ArithCompExpr = ACExpr ArithExpr ArithExpr BoolCompOp

data BoolExpr = BoolLit BoolLiteral 
                | NotExpr BoolExpr 
                | BREx BoolRecExpr
                | ACEx ArithCompExpr

data BoolRecExpr = BRExpr BoolExpr BoolExpr BoolOp

-- Store definition (mapping of variables [strings] to values)
type Store = Map Var NumLiteral

-- Stmt type
data Stmt = AssignVar Var ArithExpr 
        | Skip
        | Seq Stmt Stmt
        | IfThenElse BoolExpr Stmt Stmt
        | WhileLoop BoolExpr Stmt

-- Evaluation of Expressions
evalArithExpr :: Store -> ArithExpr -> NumLiteral
evalArithExpr store (VarExpr var) = Maybe.fromJust (Map.lookup var store)
evalArithExpr 
                                        