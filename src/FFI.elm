module FFI exposing (..)

{-|

@docs asIs, async, sync
-}

import Json.Decode as Decode
import Json.Encode as Encode exposing (Value)
import Task exposing (Task)
import Native.FFI


{-| Given a function body and a list of arguments, return a value

-}
sync : String -> List Value -> Value
sync text args =
    Native.FFI.sync text (Encode.list args)


{-| Raise any value to Json. Useful for debugging
-}
asIs : a -> Value
asIs thing =
    Native.FFI.asIs thing


{-| Like sync but works with async stuff. Use `callback(_succeed(value))` or `callback(_fail(value))`
-}
async : String -> List Value -> Task String Value
async text args =
    Native.FFI.async text (Encode.list args)
