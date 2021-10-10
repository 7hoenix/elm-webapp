module Protocol.Foobar.Auto exposing (..)


{- this file is generated by <https://github.com/choonkeat/elm-auto-encoder-decoder> do not modify manually -}


import Protocol.Foobar exposing (..)
import Array
import Dict exposing (Dict)
import Extra.Codec exposing (..)
import Json.Decode
import Json.Encode
import Platform
import Set
import Url.Builder
import Url.Parser



-- HARDCODE


encodeString : String -> Json.Encode.Value
encodeString =
    Json.Encode.string


encodeInt : Int -> Json.Encode.Value
encodeInt =
    Json.Encode.int


encodeFloat : Float -> Json.Encode.Value
encodeFloat =
    Json.Encode.float


encodeBool : Bool -> Json.Encode.Value
encodeBool =
    Json.Encode.bool


encodeList : (a -> Json.Encode.Value) -> List a -> Json.Encode.Value
encodeList =
    Json.Encode.list


encodeArrayArray : (a -> Json.Encode.Value) -> Array.Array a -> Json.Encode.Value
encodeArrayArray =
    Json.Encode.array


encodeResultResult : (x -> Json.Encode.Value) -> (a -> Json.Encode.Value) -> Result.Result x a -> Json.Encode.Value
encodeResultResult encodex encodea result =
    case result of
        Err x ->
            Json.Encode.list identity [ Json.Encode.string "Err", encodex x ]

        Ok a ->
            Json.Encode.list identity [ Json.Encode.string "Ok", encodea a ]


encodeSetSet : (comparable -> Json.Encode.Value) -> Set.Set comparable -> Json.Encode.Value
encodeSetSet encoder =
    Set.toList >> encodeList encoder


encodeDictDict : (a -> Json.Encode.Value) -> (b -> Json.Encode.Value) -> Dict.Dict a b -> Json.Encode.Value
encodeDictDict keyEncoder =
    Json.Encode.dict (\k -> Json.Encode.encode 0 (keyEncoder k))


encode_Unit : () -> Json.Encode.Value
encode_Unit value =
    Json.Encode.list identity [ encodeString "" ]


encodeJsonDecodeValue : Json.Decode.Value -> Json.Encode.Value
encodeJsonDecodeValue a =
    a


encodeJsonEncodeValue : Json.Encode.Value -> Json.Encode.Value
encodeJsonEncodeValue a =
    a



--


decodeJsonDecodeValue : Json.Decode.Decoder Json.Decode.Value
decodeJsonDecodeValue =
    Json.Decode.value


decodeJsonEncodeValue : Json.Decode.Decoder Json.Decode.Value
decodeJsonEncodeValue =
    Json.Decode.value


decodeString : Json.Decode.Decoder String
decodeString =
    Json.Decode.string


decodeInt : Json.Decode.Decoder Int
decodeInt =
    Json.Decode.int


decodeFloat : Json.Decode.Decoder Float
decodeFloat =
    Json.Decode.float


decodeBool : Json.Decode.Decoder Bool
decodeBool =
    Json.Decode.bool


decodeList : (Json.Decode.Decoder a) -> Json.Decode.Decoder (List a)
decodeList =
    Json.Decode.list


decodeArrayArray : (Json.Decode.Decoder a) -> Json.Decode.Decoder (Array.Array a)
decodeArrayArray =
    Json.Decode.array


decodeResultResult : Json.Decode.Decoder x -> Json.Decode.Decoder a -> Json.Decode.Decoder (Result.Result x a)
decodeResultResult decodex decodea =
    Json.Decode.index 0 Json.Decode.string
        |> Json.Decode.andThen
            (\s ->
                case s of
                    "Err" ->
                        Json.Decode.map Err (Json.Decode.index 1 decodex)

                    "Ok" ->
                        Json.Decode.map Ok (Json.Decode.index 1 decodea)

                    _ ->
                        Json.Decode.fail ("Unexpected: " ++ s)
            )


decodeSetSet : (Json.Decode.Decoder comparable) -> Json.Decode.Decoder (Set.Set comparable)
decodeSetSet =
    Json.Decode.list >> Json.Decode.map Set.fromList


decodeDictDict : (Json.Decode.Decoder comparable) -> (Json.Decode.Decoder b) -> Json.Decode.Decoder (Dict.Dict comparable b)
decodeDictDict keyDecoder valueDecoder =
    Json.Decode.dict valueDecoder
        |> Json.Decode.map (\dict ->
            Dict.foldl (\string v acc ->
                case Json.Decode.decodeString keyDecoder string of
                    Ok k ->
                        Dict.insert k v acc
                    Err _ ->
                        acc
            ) Dict.empty dict
        )


decode_Unit : Json.Decode.Decoder ()
decode_Unit  =
    Json.Decode.index 0 Json.Decode.string
        |> Json.Decode.andThen
            (\word ->
                case word of
                    "" -> (Json.Decode.succeed ())
                    _ -> Json.Decode.fail ("Unexpected Unit: " ++ word)
            )


-- PRELUDE


{-| CustomTypeDef { constructors = [CustomTypeConstructor (TitleCaseDotPhrase "Nothing") [],CustomTypeConstructor (TitleCaseDotPhrase "Just") [ConstructorTypeParam "a"]], name = TypeName "Maybe" ["a"] } -}
encodeMaybe : (a -> Json.Encode.Value) -> Maybe a -> Json.Encode.Value
encodeMaybe arga value =
    case value of
        (Nothing) -> (Json.Encode.list identity [ encodeString "Nothing" ])
        (Just m0) -> (Json.Encode.list identity [ encodeString "Just", (arga m0) ])



{-| CustomTypeDef { constructors = [CustomTypeConstructor (TitleCaseDotPhrase "Err") [ConstructorTypeParam "x"],CustomTypeConstructor (TitleCaseDotPhrase "Ok") [ConstructorTypeParam "a"]], name = TypeName "Result" ["x","a"] } -}
encodeResult : (x -> Json.Encode.Value) -> (a -> Json.Encode.Value) -> Result x a -> Json.Encode.Value
encodeResult argx arga value =
    case value of
        (Err m0) -> (Json.Encode.list identity [ encodeString "Err", (argx m0) ])
        (Ok m0) -> (Json.Encode.list identity [ encodeString "Ok", (arga m0) ])

{-| CustomTypeDef { constructors = [CustomTypeConstructor (TitleCaseDotPhrase "Nothing") [],CustomTypeConstructor (TitleCaseDotPhrase "Just") [ConstructorTypeParam "a"]], name = TypeName "Maybe" ["a"] } -}
decodeMaybe : (Json.Decode.Decoder (a)) -> Json.Decode.Decoder (Maybe a)
decodeMaybe arga =
    Json.Decode.index 0 Json.Decode.string
        |> Json.Decode.andThen
            (\word ->
                case word of
                    "Nothing" -> (Json.Decode.succeed Nothing)
                    "Just" -> (Json.Decode.succeed Just |> (Json.Decode.map2 (|>) (Json.Decode.index 1 (arga))))
                    _ -> Json.Decode.fail ("Unexpected Maybe: " ++ word)
            )
                 



{-| CustomTypeDef { constructors = [CustomTypeConstructor (TitleCaseDotPhrase "Err") [ConstructorTypeParam "x"],CustomTypeConstructor (TitleCaseDotPhrase "Ok") [ConstructorTypeParam "a"]], name = TypeName "Result" ["x","a"] } -}
decodeResult : (Json.Decode.Decoder (x)) -> (Json.Decode.Decoder (a)) -> Json.Decode.Decoder (Result x a)
decodeResult argx arga =
    Json.Decode.index 0 Json.Decode.string
        |> Json.Decode.andThen
            (\word ->
                case word of
                    "Err" -> (Json.Decode.succeed Err |> (Json.Decode.map2 (|>) (Json.Decode.index 1 (argx))))
                    "Ok" -> (Json.Decode.succeed Ok |> (Json.Decode.map2 (|>) (Json.Decode.index 1 (arga))))
                    _ -> Json.Decode.fail ("Unexpected Result: " ++ word)
            )
                 




{-| TypeAliasDef (AliasRecordType (TypeName "Protocol.Foobar.Foobar" []) [CustomField (FieldName "title") (CustomTypeConstructor (TitleCaseDotPhrase "String") []),CustomField (FieldName "body") (CustomTypeConstructor (TitleCaseDotPhrase "String") [])]) -}
encodeProtocolFoobarFoobar : Protocol.Foobar.Foobar -> Json.Encode.Value
encodeProtocolFoobarFoobar value =
    Json.Encode.object
        [ ("title", (encodeString) value.title)
        , ("body", (encodeString) value.body)
        ]



{-| CustomTypeDef { constructors = [CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.Save") [CustomTypeConstructor (TitleCaseDotPhrase "Maybe") [CustomTypeConstructor (TitleCaseDotPhrase "String") []],CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.Foobar") []],CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.Listing") [],CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.Load") [CustomTypeConstructor (TitleCaseDotPhrase "String") []],CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.Delete") [CustomTypeConstructor (TitleCaseDotPhrase "String") []]], name = TypeName "Protocol.Foobar.MsgFromClient" [] } -}
encodeProtocolFoobarMsgFromClient : Protocol.Foobar.MsgFromClient -> Json.Encode.Value
encodeProtocolFoobarMsgFromClient value =
    case value of
        (Protocol.Foobar.Save m0 m1) -> (Json.Encode.list identity [ encodeString "Protocol.Foobar.Save", (encodeMaybe (encodeString) m0), (encodeProtocolFoobarFoobar m1) ])
        (Protocol.Foobar.Listing) -> (Json.Encode.list identity [ encodeString "Protocol.Foobar.Listing" ])
        (Protocol.Foobar.Load m0) -> (Json.Encode.list identity [ encodeString "Protocol.Foobar.Load", (encodeString m0) ])
        (Protocol.Foobar.Delete m0) -> (Json.Encode.list identity [ encodeString "Protocol.Foobar.Delete", (encodeString m0) ])



{-| CustomTypeDef { constructors = [CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.Saved") [],CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.Listed") [CustomTypeConstructor (TitleCaseDotPhrase "Dict.Dict") [CustomTypeConstructor (TitleCaseDotPhrase "String") [],CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.Foobar") []]],CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.Loaded") [CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.Foobar") []],CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.Deleted") [CustomTypeConstructor (TitleCaseDotPhrase "String") []]], name = TypeName "Protocol.Foobar.MsgFromServer" [] } -}
encodeProtocolFoobarMsgFromServer : Protocol.Foobar.MsgFromServer -> Json.Encode.Value
encodeProtocolFoobarMsgFromServer value =
    case value of
        (Protocol.Foobar.Saved) -> (Json.Encode.list identity [ encodeString "Protocol.Foobar.Saved" ])
        (Protocol.Foobar.Listed m0) -> (Json.Encode.list identity [ encodeString "Protocol.Foobar.Listed", (encodeDictDict (encodeString) (encodeProtocolFoobarFoobar) m0) ])
        (Protocol.Foobar.Loaded m0) -> (Json.Encode.list identity [ encodeString "Protocol.Foobar.Loaded", (encodeProtocolFoobarFoobar m0) ])
        (Protocol.Foobar.Deleted m0) -> (Json.Encode.list identity [ encodeString "Protocol.Foobar.Deleted", (encodeString m0) ])



{-| CustomTypeDef { constructors = [CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.ListingPage") [],CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.NewPage") [],CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.ShowPage") [CustomTypeConstructor (TitleCaseDotPhrase "String") []],CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.EditPage") [CustomTypeConstructor (TitleCaseDotPhrase "String") []]], name = TypeName "Protocol.Foobar.Page" [] } -}
encodeProtocolFoobarPage : Protocol.Foobar.Page -> Json.Encode.Value
encodeProtocolFoobarPage value =
    case value of
        (Protocol.Foobar.ListingPage) -> (Json.Encode.list identity [ encodeString "Protocol.Foobar.ListingPage" ])
        (Protocol.Foobar.NewPage) -> (Json.Encode.list identity [ encodeString "Protocol.Foobar.NewPage" ])
        (Protocol.Foobar.ShowPage m0) -> (Json.Encode.list identity [ encodeString "Protocol.Foobar.ShowPage", (encodeString m0) ])
        (Protocol.Foobar.EditPage m0) -> (Json.Encode.list identity [ encodeString "Protocol.Foobar.EditPage", (encodeString m0) ])

{-| TypeAliasDef (AliasRecordType (TypeName "Protocol.Foobar.Foobar" []) [CustomField (FieldName "title") (CustomTypeConstructor (TitleCaseDotPhrase "String") []),CustomField (FieldName "body") (CustomTypeConstructor (TitleCaseDotPhrase "String") [])]) -}
decodeProtocolFoobarFoobar : Json.Decode.Decoder (Protocol.Foobar.Foobar)
decodeProtocolFoobarFoobar  =
    Json.Decode.succeed Protocol.Foobar.Foobar
        |> Json.Decode.map2 (|>) (Json.Decode.at [ "title" ] (decodeString))
        |> Json.Decode.map2 (|>) (Json.Decode.at [ "body" ] (decodeString))



{-| CustomTypeDef { constructors = [CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.Save") [CustomTypeConstructor (TitleCaseDotPhrase "Maybe") [CustomTypeConstructor (TitleCaseDotPhrase "String") []],CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.Foobar") []],CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.Listing") [],CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.Load") [CustomTypeConstructor (TitleCaseDotPhrase "String") []],CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.Delete") [CustomTypeConstructor (TitleCaseDotPhrase "String") []]], name = TypeName "Protocol.Foobar.MsgFromClient" [] } -}
decodeProtocolFoobarMsgFromClient : Json.Decode.Decoder (Protocol.Foobar.MsgFromClient)
decodeProtocolFoobarMsgFromClient  =
    Json.Decode.index 0 Json.Decode.string
        |> Json.Decode.andThen
            (\word ->
                case word of
                    "Protocol.Foobar.Save" -> (Json.Decode.succeed Protocol.Foobar.Save |> (Json.Decode.map2 (|>) (Json.Decode.index 1 (decodeMaybe (decodeString)))) |> (Json.Decode.map2 (|>) (Json.Decode.index 2 (decodeProtocolFoobarFoobar))))
                    "Protocol.Foobar.Listing" -> (Json.Decode.succeed Protocol.Foobar.Listing)
                    "Protocol.Foobar.Load" -> (Json.Decode.succeed Protocol.Foobar.Load |> (Json.Decode.map2 (|>) (Json.Decode.index 1 (decodeString))))
                    "Protocol.Foobar.Delete" -> (Json.Decode.succeed Protocol.Foobar.Delete |> (Json.Decode.map2 (|>) (Json.Decode.index 1 (decodeString))))
                    _ -> Json.Decode.fail ("Unexpected Protocol.Foobar.MsgFromClient: " ++ word)
            )
                 



{-| CustomTypeDef { constructors = [CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.Saved") [],CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.Listed") [CustomTypeConstructor (TitleCaseDotPhrase "Dict.Dict") [CustomTypeConstructor (TitleCaseDotPhrase "String") [],CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.Foobar") []]],CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.Loaded") [CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.Foobar") []],CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.Deleted") [CustomTypeConstructor (TitleCaseDotPhrase "String") []]], name = TypeName "Protocol.Foobar.MsgFromServer" [] } -}
decodeProtocolFoobarMsgFromServer : Json.Decode.Decoder (Protocol.Foobar.MsgFromServer)
decodeProtocolFoobarMsgFromServer  =
    Json.Decode.index 0 Json.Decode.string
        |> Json.Decode.andThen
            (\word ->
                case word of
                    "Protocol.Foobar.Saved" -> (Json.Decode.succeed Protocol.Foobar.Saved)
                    "Protocol.Foobar.Listed" -> (Json.Decode.succeed Protocol.Foobar.Listed |> (Json.Decode.map2 (|>) (Json.Decode.index 1 (decodeDictDict (decodeString) (decodeProtocolFoobarFoobar)))))
                    "Protocol.Foobar.Loaded" -> (Json.Decode.succeed Protocol.Foobar.Loaded |> (Json.Decode.map2 (|>) (Json.Decode.index 1 (decodeProtocolFoobarFoobar))))
                    "Protocol.Foobar.Deleted" -> (Json.Decode.succeed Protocol.Foobar.Deleted |> (Json.Decode.map2 (|>) (Json.Decode.index 1 (decodeString))))
                    _ -> Json.Decode.fail ("Unexpected Protocol.Foobar.MsgFromServer: " ++ word)
            )
                 



{-| CustomTypeDef { constructors = [CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.ListingPage") [],CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.NewPage") [],CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.ShowPage") [CustomTypeConstructor (TitleCaseDotPhrase "String") []],CustomTypeConstructor (TitleCaseDotPhrase "Protocol.Foobar.EditPage") [CustomTypeConstructor (TitleCaseDotPhrase "String") []]], name = TypeName "Protocol.Foobar.Page" [] } -}
decodeProtocolFoobarPage : Json.Decode.Decoder (Protocol.Foobar.Page)
decodeProtocolFoobarPage  =
    Json.Decode.index 0 Json.Decode.string
        |> Json.Decode.andThen
            (\word ->
                case word of
                    "Protocol.Foobar.ListingPage" -> (Json.Decode.succeed Protocol.Foobar.ListingPage)
                    "Protocol.Foobar.NewPage" -> (Json.Decode.succeed Protocol.Foobar.NewPage)
                    "Protocol.Foobar.ShowPage" -> (Json.Decode.succeed Protocol.Foobar.ShowPage |> (Json.Decode.map2 (|>) (Json.Decode.index 1 (decodeString))))
                    "Protocol.Foobar.EditPage" -> (Json.Decode.succeed Protocol.Foobar.EditPage |> (Json.Decode.map2 (|>) (Json.Decode.index 1 (decodeString))))
                    _ -> Json.Decode.fail ("Unexpected Protocol.Foobar.Page: " ++ word)
            )
                 