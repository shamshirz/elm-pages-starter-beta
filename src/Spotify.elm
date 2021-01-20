module Spotify exposing (Artist, spotifyData)

import OptimizedDecoder as Decode exposing (Decoder)
import Pages.Secrets
import Pages.StaticHttp as StaticHttp


type alias Artist =
    { genres : List String, name : String }


spotifyData : StaticHttp.Request (List Artist)
spotifyData =
    accessTokenData
        |> StaticHttp.andThen topArtistsRequest


{-| Request to spotify for a bearer token for a specific user app (mine)
Requires environment variables `CLIENT_TOKEN` and `REFRESH_TOKEN`
-}
accessTokenData : StaticHttp.Request String
accessTokenData =
    StaticHttp.request
        (Pages.Secrets.succeed
            (\clientToken refreshToken ->
                { url = "https://accounts.spotify.com/api/token"
                , method = "POST"
                , headers = [ ( "Authorization", "Basic " ++ clientToken ) ]
                , body = StaticHttp.stringBody "application/x-www-form-urlencoded" ("grant_type=refresh_token&refresh_token=" ++ refreshToken)
                }
            )
            |> Pages.Secrets.with "CLIENT_TOKEN"
            |> Pages.Secrets.with "REFRESH_TOKEN"
        )
        (Decode.field "access_token" Decode.string)


topArtistsRequest : String -> StaticHttp.Request (List Artist)
topArtistsRequest accessToken =
    StaticHttp.request
        (Pages.Secrets.succeed
            { url = "https://api.spotify.com/v1/me/top/artists?limit=5"
            , method = "GET"
            , headers =
                [ ( "Authorization", "Bearer " ++ accessToken )
                , ( "Content-Type", "application/json" )
                , ( "Accept", "application/json" )
                ]
            , body = StaticHttp.emptyBody
            }
        )
        (Decode.field "items"
            (Decode.list
                (Decode.map2 Artist
                    (Decode.field "genres" (Decode.list Decode.string))
                    (Decode.field "name" Decode.string)
                )
            )
        )
