
import Control.Monad
-- import Data.Array
import Data.Bits
-- import Data.List
-- import Data.List.Split
-- import Data.Set
import Debug.Trace
import System.Environment
import System.IO
import System.IO.Unsafe

type Point = (Double, Double)                   -- input coordinates
type Polygon = [Point]                          -- list of all input coordinates

-- To check if it is Polygon or not. If the coordinates are more than three it is Polygon
isPolygon :: Polygon -> Bool
isPolygon []  = False
isPolygon polygon = if length polygon >= 3 then True else False