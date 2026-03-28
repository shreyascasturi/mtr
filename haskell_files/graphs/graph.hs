-- I want to build a notion of a graph.
-- A graph will have some set of vertices
-- and edges.
-- For now, let's focus on a vertex.

-- A vertex is a Node:
-- A Node has a Value and a list of edges it belongs to.
-- A node has a Value -> Value can be any type.
-- We should distinguish between values
-- StringNode, IntNode, DoubleNode
-- An edge is a Tuple of ([Node], Node)
-- So Graph is:
-- ([Node], [([Node], Node)])
-- Edge 1: ([Tails: X, Y, Z], [Head: C])

-- Assume no cycles for now
-- getIntVertVal :: Vertex -> Maybe Int
-- getIntVertVal (IntVertex intVal) = Just intVal
-- getIntVertVal (StringVertex _) = Nothing 
-- getIntVertVal (DoubleVertex _) = Nothing

-- getStringVertVal :: Vertex -> Maybe String
-- getStringVertVal (IntVertex _) = Nothing
-- getStringVertVal (StringVertex stringVal) = Just stringVal
-- getStringVertVal (DoubleVertex _) = Nothing

-- getDoubleVertVal :: Vertex
--  -> Maybe Double
-- getDoubleVertVal (IntVertex _) = Nothing
-- getDoubleVertVal (StringVertex _) = Nothing
-- getDoubleVertVal (DoubleVertex doubleVal) = Just doubleVal


--data Vertex = IntVertex Int | DoubleVertex Double | StringVertex String deriving (Show)

data Vertex = Vertex { 
    value :: Int,
    neighbors :: [Vertex]
}

data Edge = Edge {
    vertexOne :: Vertex,
    vertexTwo :: Vertex
}

data Graph = Graph {
    vertexSet :: [Vertex],
    edgeSet :: [Edge]

}
-- data Hyperedge = Hyperedge {
--     tails :: [Vertex],
--     head :: Vertex
-- } deriving (Show)

-- data Graph = Graph {
--     vertexSet :: [Vertex],
--     edgeSet :: [Hyperedge]
-- } deriving (Show)

-- getStringVertVal :: StringVertex -> String
-- getStringVertVal (StringVertex stringVal) = stringVal

-- getDoubleVertVal :: DoubleVertex -> Double
-- getDobleVertVal (DoubleVertex doubleVal) = doubleVal