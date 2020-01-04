module MassiveDecks.Pages.Lobby.Messages exposing (Msg(..))

import MassiveDecks.Animated as Animated
import MassiveDecks.Game.Messages as Game
import MassiveDecks.Models.MdError exposing (MdError)
import MassiveDecks.Pages.Lobby.Configure.Messages as Configure
import MassiveDecks.Pages.Lobby.Events exposing (Event)
import MassiveDecks.Pages.Lobby.Model exposing (..)


type Msg
    = GameMsg Game.Msg
    | EventReceived Event
    | ErrorReceived MdError
    | ConfigureMsg Configure.Msg
    | NotificationMsg (Animated.Msg Notification)
    | ToggleInviteDialog