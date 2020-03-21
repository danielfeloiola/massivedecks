module MassiveDecks.Strings.Languages.PtBR exposing (pack)

{-| General English-language translation.
This is the primary language, strings here are the canonical representation, and are suitable to translate from.
-}

import MassiveDecks.Strings exposing (MdString(..))
import MassiveDecks.Strings.Translation as Translation exposing (Result(..))


pack : Translation.Pack
pack =
    { code = "pt-BR"
    , name = Português
    , translate = translate
    }



{- Private -}


{-| The English translation
-}
translate : MdString -> List Translation.Result
translate mdString =
    case mdString of
        -- General
        MassiveDecks ->
            [ Text "Cartas vs Mari" ]

        Close ->
            [ Text "Fechar" ]

        -- Special
        Plural { singular, amount } ->
            if amount == Just 1 then
                [ Raw singular ]

            else
                [ Raw singular, Text "s" ]

        -- Start screen.
        Version { versionNumber } ->
            [ Text "Versão “", Text versionNumber, Text "”" ]

        ShortGameDescription ->
            [ Text "Um jogo para pessoas horríveis." ]

        WhatIsThis ->
            [ Text "O que é ", Ref MassiveDecks, Text "?" ]

        GameDescription ->
            [ Ref MassiveDecks
            , Text " é um jogo de comédia baseado no "
            , Ref CardsAgainstHumanity
            , Text ", pesenvolvido por "
            , Ref RereadGames
            , Text " e outros contribuidores—esse jogo é de código aberto sob "
            , Ref License
            , Text ", ajude a melhorar o jogo, acesse o código-fonte, ou descubra mais no "
            , Ref MDProject
            , Text "."
            ]

        NewGame ->
            [ Text "Novo" ]

        FindPublicGame ->
            [ Text "Encontrar" ]

        JoinPrivateGame ->
            [ Text "Entrar" ]

        PlayGame ->
            [ Text "Jogar" ]

        AboutTheGame ->
            [ Text "Sobre" ]

        AboutTheGameDescription ->
            [ Text "Saiba mais ", Ref MassiveDecks, Text " e como foi desenvolvido." ]

        MDLogoDescription ->
            [ Text "A ", Ref Call, Text " and a ", Ref Response, Text " marked with an “M” and a “D”." ]

        RereadLogoDescription ->
            [ Text "A book circled by a recycling arrow." ]

        MDProject ->
            [ Text "GitHub" ]

        License ->
            [ Text "a licença AGPLv3" ]

        DevelopedByReread ->
            [ Text "Desenvolvido por ", Ref RereadGames, Text "." ]

        RereadGames ->
            [ Text "Reread Games" ]

        NameLabel ->
            [ Text "Seu nome" ]

        NameInUse ->
            [ Text "Alguém já está usando esse nome - escolha outro." ]

        RejoinTitle ->
            [ Text "Reentrar no jogo" ]

        RejoinGame { code } ->
            [ Text "Reentrar “", GameCode { code = code } |> Ref, Text "”." ]

        LobbyRequiresPassword ->
            [ Text "Você precisa de uma senha para entrar neste jogo. Pergunte a pessoa que te convidou." ]

        YouWereKicked ->
            [ Text "Você foi expulso do jogo." ]

        -- Rules
        CardsAgainstHumanity ->
            [ Text "Cards Against Humanity" ]

        Rules ->
            [ Text "How to play." ]

        RulesHand ->
            [ Text "Each player has a hand of ", Ref (Plural { singular = Response, amount = Nothing }), Text "." ]

        RulesCzar ->
            [ Text "The first player begins as the "
            , Ref Czar
            , Text ". the "
            , Ref Czar
            , Text " reads the question or fill-in-the-blank phrase on the "
            , Ref Call
            , Text " out loud."
            ]

        RulesPlaying ->
            [ Text "Everyone else answers the question or fills in the blank by choosing a "
            , Ref Response
            , Text " from their hand to play for the round."
            ]

        RulesJudging ->
            [ Text "The answers are then shuffled and the "
            , Ref Czar
            , Text " reads them out to the other players—for full effect, the "
            , Ref Czar
            , Text " should usually re-read the "
            , Ref Call
            , Text " before presenting each answer. The "
            , Ref Czar
            , Text " then picks the funniest play, and whoever played it gets one "
            , Ref Point
            , Text "."
            ]

        RulesPickTitle ->
            [ Ref (Pick { numberOfCards = 2 }) ]

        RulesPick ->
            [ Text "Some cards will need more than one "
            , Ref Response
            , Text " as an answer. Play the cards in the order the "
            , Ref Czar
            , Text " should read them—the order matters."
            ]

        ExamplePickDescription ->
            [ Ref (Plural { singular = Call, amount = Nothing })
            , Text " like this will require picking more "
            , Ref (Plural { singular = Response, amount = Nothing })
            , Text ", but give you more to pick from."
            ]

        RulesDraw ->
            [ Text "Some "
            , Ref (Plural { singular = Call, amount = Nothing })
            , Text " will need even more "
            , Ref (Plural { singular = Response, amount = Nothing })
            , Text "—these will say "
            , Ref (Draw { numberOfCards = 2 })
            , Text " or more, and you’ll get that many extra cards before you play."
            ]

        GameRulesTitle ->
            [ Text "Game Rules" ]

        HouseRulesTitle ->
            [ Text "House Rules" ]

        HouseRules ->
            [ Text "You can change the way the game is played in a variety of ways. While setting up the game, choose "
            , Text "as many house rules as you would like to use."
            ]

        HouseRuleReboot ->
            [ Text "Rebooting the Universe" ]

        HouseRuleRebootDescription { cost } ->
            [ Text "At any time, players may trade in "
            , Text (an cost)
            , Ref (Plural { singular = Point, amount = cost })
            , Text " to discard their hand and draw a new one."
            ]

        HouseRuleRebootAction { cost } ->
            [ Text "Spend "
            , Text (asWord cost)
            , Text " "
            , Ref (Plural { singular = Point, amount = Just cost })
            , Text " to discard your hand and draw a new one."
            ]

        HouseRuleRebootCost ->
            [ Ref Point, Text " Cost" ]

        HouseRuleRebootCostDescription ->
            [ Text "How many ", Ref (Plural { singular = Point, amount = Nothing }), Text " it costs to redraw." ]

        HouseRulePackingHeat ->
            [ Text "Packing Heat" ]

        HouseRulePackingHeatDescription ->
            [ Text "Any "
            , Ref (Plural { singular = Call, amount = Nothing })
            , Text " with "
            , Ref (Pick { numberOfCards = 2 })
            , Text " also get "
            , Ref (Draw { numberOfCards = 1 })
            , Text ", so everyone has more options."
            ]

        HouseRuleComedyWriter ->
            [ Text "Comedy Writer" ]

        HouseRuleComedyWriterDescription ->
            [ Text "Add blank "
            , Ref (Plural { singular = Response, amount = Nothing })
            , Text " where players can write custom responses."
            ]

        HouseRuleComedyWriterNumber ->
            [ Text "Blank ", Ref (Plural { singular = Response, amount = Nothing }) ]

        HouseRuleComedyWriterNumberDescription ->
            [ Text "The number of Blank "
            , Ref (Plural { singular = Response, amount = Nothing })
            , Text "that will be in the game."
            ]

        HouseRuleComedyWriterExclusive ->
            [ Text "Only Blank ", Ref (Plural { singular = Response, amount = Nothing }) ]

        HouseRuleComedyWriterExclusiveDescription ->
            [ Text "If enabled, all other "
            , Ref (Plural { singular = Response, amount = Nothing })
            , Text " will be ignored, only blank ones will exist in-game."
            ]

        HouseRuleRandoCardrissian ->
            [ Text "Rando Cardrissian" ]

        HouseRuleRandoCardrissianDescription ->
            [ Text "Every round, the first "
            , Ref Response
            , Text " in the deck will be played as an answer. This play belongs to an AI player named "
            , Text "Rando Cardrissian, and if he wins the game, all players go home in a state of everlasting shame."
            ]

        HouseRuleRandoCardrissianNumber ->
            [ Text "AI Players" ]

        HouseRuleRandoCardrissianNumberDescription ->
            [ Text "The number of AI players that will be in the game." ]

        MustBeMoreThanOrEqualValidationError { min } ->
            [ Text "O valor precisa ser no mínimo ", Text (String.fromInt min), Text "." ]

        MustBeLessThanOrEqualValidationError { max } ->
            [ Text "O valor precisa ser no máximo  ", Text (String.fromInt max), Text "." ]

        SetValue { value } ->
            [ Text "Ajuste o valor para ", Text (String.fromInt value), Text "." ]

        CantBeEmpty ->
            [ Text "Não pode ficar vazio." ]

        SettingsTitle ->
            [ Text "Ajustes" ]

        LanguageSetting ->
            [ Text "Idioma" ]

        MissingLanguage ->
            [ Text "Não encontrou o seu idioma? ", Ref TranslationBeg ]

        TranslationBeg ->
            [ Text "Ajude a traduzir "
            , Ref MassiveDecks
            , Text "!"
            ]

        CardSizeSetting ->
            [ Text "Compact Cards" ]

        CardSizeExplanation ->
            [ Text "Adjust how big cards are—this can be useful on small screens to scroll less." ]

        SpeechSetting ->
            [ Text "Text To Speech" ]

        SpeechExplanation ->
            [ Text "Read out cards using text to speech." ]

        SpeechNotSupportedExplanation ->
            [ Text "Your browser does not support text to speech, or has no voices installed." ]

        VoiceSetting ->
            [ Text "Speech Voice" ]

        NotificationsSetting ->
            [ Text "Browser Notifications" ]

        NotificationsExplanation ->
            [ Text "Alert you when you need to do something in the game using browser notifications."
            ]

        NotificationsUnsupportedExplanation ->
            [ Text "Your browser doesn't support notifications." ]

        NotificationsBrowserPermissions ->
            [ Text "You will need to give permission for "
            , Ref MassiveDecks
            , Text " to notify you. This will only be used while the game is open and while you have this enabled."
            ]

        NotificationOnlyWhenHiddenSetting ->
            [ Text "Only When Hidden" ]

        NotificationsOnlyWhenHiddenExplanation ->
            [ Text "Only send notifications when you are not looking at the page (e.g: on another tab or minimised)." ]

        NotificationsOnlyWhenHiddenUnsupportedExplanation ->
            [ Text "Your browser doesn't support checking for page visibility." ]

        -- Terms
        Czar ->
            [ Text "Czar das Cartas" ]

        CzarDescription ->
            [ Text "O jogador está julgando a rodada." ]

        Player ->
            [ Text "Jogador" ]

        Spectator ->
            [ Text "Espectador" ]

        Call ->
            [ Text "Carta Preta" ]

        CallDescription ->
            [ Text "A black card with a question or fill-in-the-blank phrase." ]

        Response ->
            [ Text "Carta Branca" ]

        ResponseDescription ->
            [ Text "A white card with a phrase played into rounds." ]

        Point ->
            [ Text "Awesome Point" ]

        PointDescription ->
            [ Text "A point—having more means winning." ]

        GameCodeTerm ->
            [ Text "Código do Jogo" ]

        GameCodeDescription ->
            [ Text "O código que permite outras pessoas encontrar e entrar no seu jogo." ]

        GameCode { code } ->
            [ Text code ]

        GameCodeSpecificDescription ->
            [ Text "Dê esse código para as pessoas para que elas entrem no seu jogo." ]

        GameCodeHowToAcquire ->
            [ Text "Peça para a pessoa que te convidou o ", Ref GameCodeTerm, Text "." ]

        Deck ->
            [ Text "Deck" ]

        StillPlaying ->
            [ Text "Jogando" ]

        PlayingDescription ->
            [ Text "Esse jogador está na partida, mas ainda não fez uma jogada." ]

        Played ->
            [ Text "Jogou" ]

        PlayedDescription ->
            [ Text "This player has submitted their play for the round." ]

        -- Lobby Browser
        LobbyBrowserTitle ->
            [ Text "Public Games" ]

        NoPublicGames ->
            [ Text "No public games available." ]

        PlayingGame ->
            [ Text "Games that are in progress." ]

        SettingUpGame ->
            [ Text "Games that have not yet started." ]

        StartYourOwn ->
            [ Text "Start a new game?" ]

        -- Spectation
        JoinTheGame ->
            [ Text "Join the game!" ]

        ToggleAdvertDescription ->
            [ Text "Toggle showing the information on joining the game." ]

        -- Cards
        Pick numberOfCards ->
            [ Text "Pick", Ref (NumberOfCards numberOfCards) ]

        Draw numberOfCards ->
            [ Text "Draw", Ref (NumberOfCards numberOfCards) ]

        PickDescription { numberOfCards } ->
            [ Text "You need to play "
            , Text (asWord numberOfCards)
            , Text " "
            , Ref (Plural { singular = Response, amount = Just numberOfCards })
            , Text "."
            ]

        DrawDescription { numberOfCards } ->
            [ Text "You get "
            , Text (asWord numberOfCards)
            , Text " extra "
            , Ref (Plural { singular = Response, amount = Just numberOfCards })
            , Text " before playing."
            ]

        NumberOfCards { numberOfCards } ->
            [ Text (String.fromInt numberOfCards) ]

        -- Lobby
        Invite ->
            [ Text "Invite players to the game." ]

        InviteLinkHelp ->
            [ Text "Send this link to players to invite them to the game, or let them scan the QR code below." ]

        InviteExplanation { gameCode, password } ->
            let
                extra =
                    password
                        |> Maybe.map
                            (\p ->
                                [ Text " and the game password “"
                                , Text p
                                , Text "”"
                                ]
                            )
                        |> Maybe.withDefault []
            in
            List.concat
                [ [ Text "Your game code is "
                  , Ref (GameCode { code = gameCode })
                  , Text ". Players can join the game by loading "
                  , Ref MassiveDecks
                  , Text " and entering that code"
                  ]
                , extra
                , [ Text "."
                  ]
                ]

        Cast ->
            [ Text "Transmitir para TV." ]

        CastConnecting ->
            [ Text "Conectando…" ]

        CastConnected { deviceName } ->
            [ Text "Transmitindo para ", Text deviceName, Text "." ]

        Players ->
            [ Ref (Plural { singular = Player, amount = Nothing }) ]

        PlayersDescription ->
            [ Text "Usuários jogando o jogo." ]

        Spectators ->
            [ Ref (Plural { singular = Spectator, amount = Nothing }) ]

        SpectatorsDescription ->
            [ Text "Usuários jogando o jogo sem jogar." ]

        Left ->
            [ Text "Left" ]

        LeftDescription ->
            [ Text "Usuários que abandonaram o jogo." ]

        Away ->
            [ Text "Fora" ]

        AwayDescription ->
            [ Text "Este usuário está temporariamente fora do jogo." ]

        Disconnected ->
            [ Text "Desconectado" ]

        DisconnectedDescription ->
            [ Text "Este usuário não está conectado no jogo." ]

        Privileged ->
            [ Text "Proprietário" ]

        PrivilegedDescription ->
            [ Text "Este usuário pode ajustar as configurações do jogo." ]

        Ai ->
            [ Text "AI" ]

        AiDescription ->
            [ Text "Este jogador é controlado pelo computador." ]

        Score { total } ->
            [ Text (String.fromInt total) ]

        ScoreDescription ->
            [ Text "O número de "
            , Ref (Plural { singular = Point, amount = Nothing })
            , Text " que este jogador tem."
            ]

        Likes { total } ->
            [ Text (String.fromInt total) ]

        LikesDescription ->
            [ Text "O número de likes recebidos."
            ]

        ToggleUserList ->
            [ Text "Mostrar ou esconder a pontuação." ]

        GameMenu ->
            [ Text "Menu do jogo." ]

        UnknownUser ->
            [ Text "Um usuário desconhecido" ]

        InvitePlayers ->
            [ Text "Convidar jogadores" ]

        InvitePlayersDescription ->
            [ Text "Get the game code/link/qr code to let others join this game." ]

        SetAway ->
            [ Text "Mark As Away" ]

        SetBack ->
            [ Text "Mark As Back" ]

        LeaveGame ->
            [ Text "Sair do jogo" ]

        LeaveGameDescription ->
            [ Text "Sair permanentemente do jogo." ]

        Spectate ->
            [ Text "Assisitir" ]

        SpectateDescription ->
            [ Text "Abre uma tela de espectador em uma nova aba." ]

        BecomeSpectator ->
            [ Text "Assitir" ]

        BecomeSpectatorDescription ->
            [ Text "Assista ao jogo sem jogar." ]

        BecomePlayer ->
            [ Text "Play" ]

        BecomePlayerDescription ->
            [ Text "Play in the game." ]

        EndGame ->
            [ Text "Terminar partida" ]

        EndGameDescription ->
            [ Text "Termina a partida agora." ]

        ReturnViewToGame ->
            [ Text "Voltar" ]

        ReturnViewToGameDescription ->
            [ Text "Return to the main game view." ]

        ViewConfgiuration ->
            [ Text "Configurar" ]

        ViewConfgiurationDescription ->
            [ Text "Switch to view the game's configuration." ]

        KickUser ->
            [ Text "Expulsar" ]

        Promote ->
            [ Text "Promover" ]

        Demote ->
            [ Text "Demover" ]

        -- Notifications
        UserConnected { username } ->
            [ Text username, Text " se reconectou." ]

        UserDisconnected { username } ->
            [ Text username, Text " se desconectou." ]

        UserJoined { username } ->
            [ Text username, Text " entrou no jogo." ]

        UserLeft { username } ->
            [ Text username, Text " saiu do jogo." ]

        UserKicked { username } ->
            [ Text username, Text " foi expulso do jogo." ]

        Dismiss ->
            [ Text "Dispensar" ]

        -- Configuration
        ConfigureTitle ->
            [ Text "Ajustes do jogo" ]

        NoDecks ->
            [ Segment [ Text "No decks. " ]
            , Text " "
            , Segment [ Text "Você vai precisar de pelo menos um deck para jopgar." ]
            ]

        NoDecksHint ->
            [ Text "Not sure? Add the original ", Raw CardsAgainstHumanity, Text " deck." ]

        WaitForDecks ->
            [ Text "The decks must load before you can start the game." ]

        MissingCardType { cardType } ->
            [ Text "None of your decks contain any "
            , Ref (Plural { singular = cardType, amount = Nothing })
            , Text ". You need a deck that does to start the game."
            ]

        NotEnoughCardsOfType { cardType, needed, have } ->
            [ Text "For the number of players in the game, you need at least "
            , Text (needed |> String.fromInt)
            , Text " "
            , Ref (Plural { singular = cardType, amount = Just needed })
            , Text " but you only have "
            , Text (have |> String.fromInt)
            , Text "."
            ]

        AddDeck ->
            [ Text "Add deck." ]

        RemoveDeck ->
            [ Text "Remove deck." ]

        SourceNotFound { source } ->
            [ Ref source, Text " doesn't recognise the deck you asked for. Check the details you gave are correct." ]

        SourceServiceFailure { source } ->
            [ Ref source, Text " failed to provide the deck. Please try again later or try another source." ]

        Cardcast ->
            [ Text "Cardcast" ]

        CardcastPlayCode ->
            [ Ref Cardcast, Text " código do jogo" ]

        CardcastEmptyPlayCode ->
            [ Text "Enter a ", Ref CardcastPlayCode, Text " for the deck you want to add." ]

        APlayer ->
            [ Text "Um jogador" ]

        DeckAlreadyAdded ->
            [ Text "Este deck já está no jogo." ]

        ConfigureDecks ->
            [ Text "Decks" ]

        ConfigureRules ->
            [ Text "Regras" ]

        ConfigureTimeLimits ->
            [ Text "Limite de tempo" ]

        ConfigurePrivacy ->
            [ Text "Privacidade" ]

        HandSize ->
            [ Text "Tamanho da mão" ]

        HandSizeDescription ->
            [ Text "Número de cartas que cada jogador tem um sua mão durante o jogo." ]

        ScoreLimit ->
            [ Ref Point, Text " Limit" ]

        ScoreLimitDescription ->
            [ Segment
                [ Text "The number of "
                , Ref (Plural { singular = Point, amount = Nothing })
                , Text " a player needs to win the game."
                ]
            , Text " "
            , Segment [ Text "Se desativada o jogo continuará indefinidamente." ]
            ]

        UnsavedChangesWarning ->
            [ Text "You have unsaved changes to the configuration, they must be saved first if you want them to apply "
            , Text "to the game."
            ]

        SaveChanges ->
            [ Text "Save your changes." ]

        RevertChanges ->
            [ Text "Descartar mudanças não salvas." ]

        NeedAtLeastOneDeck ->
            [ Text "Você precisa adicionar um deck de cartas para iniciar a partida." ]

        NeedAtLeastThreePlayers ->
            [ Text "Você precisa de pelo menos 3 jogadores para iniciar a partida." ]

        NeedAtLeastOneHuman ->
            [ Text "Unfortunately computer players can't be the "
            , Ref Czar
            , Text ", so you need at least one human player to start the game."
            , Text " (Although only one human might be a bit boring!)"
            ]

        RandoCantWrite ->
            [ Text "Jogadores controlados pelo computador não podem escrever as próprias cartas." ]

        DisableComedyWriter ->
            [ Text "Desativado ", Ref HouseRuleComedyWriter ]

        DisableRando ->
            [ Text "Desativado ", Ref HouseRuleRandoCardrissian ]

        AddAnAiPlayer ->
            [ Text "Adiciona um jogador controlado pelo computador ao jogo." ]

        PasswordShared ->
            [ Text "Anyone in the game can see the password! "
            , Text "Hiding it above only affects you (useful if streaming, etc…)."
            ]

        PasswordNotSecured ->
            [ Text "Game passwords are "
            , Em [ Text "not" ]
            , Text " stored securely—given this, please "
            , Em [ Text "do not" ]
            , Text " use serious passwords you use elsewhere!"
            ]

        LobbyPassword ->
            [ Text "Senha do jogo" ]

        LobbyPasswordDescription ->
            [ Text "A senha que os usuários devem digitar antes de acessar o jogo." ]

        StartGame ->
            [ Text "Começar Jogo" ]

        Public ->
            [ Text "Jogo público" ]

        PublicDescription ->
            [ Text "Se ativado, o jogo aparecerá na lista pública, e poderá ser encontrado por qualquer pessoa." ]

        ApplyConfiguration ->
            [ Text "Aplicar mudanças." ]

        AppliedConfiguration ->
            [ Text "Salvo." ]

        InvalidConfiguration ->
            [ Text "Este valor não é válido." ]

        Automatic ->
            [ Text "Automatically Mark Players As Away" ]

        AutomaticDescription ->
            [ Text "If enabled, when the time limit runs out players will automatically be marked as away. "
            , Text "Otherwise someone will need to press the button to do so."
            ]

        TimeLimit { stage } ->
            [ Ref stage, Text " Time Limit" ]

        PlayingTimeLimitDescription ->
            [ Text "How long (in seconds) the ", Ref Players, Text " have to make their plays." ]

        RevealingTimeLimitDescription ->
            [ Text "How long (in seconds) the ", Ref Czar, Text " has to reveal the plays." ]

        JudgingTimeLimitDescription ->
            [ Text "How long (in seconds) the ", Ref Czar, Text " has to judge the plays." ]

        CompleteTimeLimitDescription ->
            [ Text "How much time (in seconds) to wait after one round ends before starting the next one." ]

        Conflict ->
            [ Text "Conflict" ]

        ConflictDescription ->
            [ Text "Someone else made changes to this while you were also making changes. "
            , Text "Please choose if you want to keep your changes or theirs."
            ]

        YourChanges ->
            [ Text "Suas mudanças" ]

        TheirChanges ->
            [ Text "Mudanças dos outros" ]

        -- Game
        SubmitPlay ->
            [ Text "Give these cards to the ", Ref Czar, Text " as your play for the round." ]

        TakeBackPlay ->
            [ Text "Take back your cards to change your play for the round." ]

        JudgePlay ->
            [ Text "Pick this play as the winner for the round." ]

        LikePlay ->
            [ Text "Add a like to this play." ]

        AdvanceRound ->
            [ Text "Next round." ]

        Playing ->
            [ Text "Playing" ]

        Revealing ->
            [ Text "Revealing" ]

        Judging ->
            [ Text "Judging" ]

        Complete ->
            [ Text "Finished" ]

        ViewGameHistoryAction ->
            [ Text "View previous rounds from this game." ]

        ViewHelpAction ->
            [ Text "Help" ]

        EnforceTimeLimitAction ->
            [ Text "Set all players the game is waiting on to away and skip them until they return." ]

        Blank ->
            [ Text "Blank" ]

        RoundStarted ->
            [ Text "Round Started" ]

        JudgingStarted ->
            [ Text "Judging Started" ]

        Paused ->
            [ Text "The game has been paused because there are not enough active players to continue."
            , Text "When someone joins or returns it will continue automatically."
            ]

        ClientAway ->
            [ Text "You are currently set as away from the game, and are not playing." ]

        -- Instructions
        PlayInstruction { numberOfCards } ->
            [ Text "You need to choose "
            , Text (asWord numberOfCards)
            , Text " more "
            , Ref (Plural { singular = Response, amount = Just numberOfCards })
            , Text " from your hand into this round before you can submit your play."
            ]

        SubmitInstruction ->
            [ Text "You need to submit your play for this round." ]

        WaitingForPlaysInstruction ->
            [ Text "You are waiting for other players to play into the round." ]

        CzarsDontPlayInstruction ->
            [ Text "You are the "
            , Ref Czar
            , Text " for the round - you don't submit any "
            , Ref (Plural { singular = Response, amount = Nothing })
            , Text ". Instead you choose the winner once everyone else has submitted theirs."
            ]

        NotInRoundInstruction ->
            [ Text "You are not in this round. You will play in the next one unless you are set to away." ]

        RevealPlaysInstruction ->
            [ Text "Click on the plays to flip them, then pick the one you think is best." ]

        WaitingForCzarInstruction ->
            [ Text "You can like plays while you wait for the ", Ref Czar, Text " to reveal the plays and pick a winner for the round." ]

        AdvanceRoundInstruction ->
            [ Text "A próxima rodada já começou. Você pode avançar." ]

        -- 404 Unknown
        UnknownPageTitle ->
            [ Text "Erro 404: Página desconhecida." ]

        GoBackHome ->
            [ Text "Voltar para a página inicial." ]

        -- Actions
        Refresh ->
            [ Text "Atualizar" ]

        -- Errors
        Error ->
            [ Text "Erro" ]

        ErrorHelp ->
            [ Text "The game server might be down, or this might be a bug. Refreshing the page should get you going "
            , Text "again. More details can be found below."
            ]

        ErrorHelpTitle ->
            [ Text "Sorry, something went wrong." ]

        ReportError ->
            [ Text "Report Bug" ]

        ReportErrorDescription ->
            [ Text "Let the developers know about a bug you encountered so they can fix it." ]

        ReportErrorBody ->
            [ Text "I was [replace with a short explanation of what you were doing] when I got the following error:" ]

        BadUrlError ->
            [ Text "We tried to make a request to an invalid page." ]

        TimeoutError ->
            [ Text "The server didn’t respond for too long. It may be down, please try again after a short delay." ]

        NetworkError ->
            [ Text "Your internet connection was interrupted." ]

        ServerDownError ->
            [ Text "The game server is currently offline. Please try again later." ]

        BadStatusError ->
            [ Text "The server gave a response we didn’t expect." ]

        BadPayloadError ->
            [ Text "The server gave a response we didn’t understand." ]

        PatchError ->
            [ Text "The server gave a patch we couldn't apply." ]

        VersionMismatch ->
            [ Text "The server gave a config change for a different version than we expected." ]

        CastError ->
            [ Text "Sorry, something went wrong trying to connect to the game." ]

        ActionExecutionError ->
            [ Text "You can't perform that action." ]

        IncorrectPlayerRoleError { role, expected } ->
            [ Text "You need to be a ", Ref expected, Text " to do that, but you are a ", Ref role, Text "." ]

        IncorrectUserRoleError { role, expected } ->
            [ Text "You need to be a ", Ref expected, Text " to do that, but you are a ", Ref role, Text "." ]

        IncorrectRoundStageError { stage, expected } ->
            [ Text "The round needs to be at the ", Ref expected, Text " stage to do that, but it is at the ", Ref stage, Text " stage." ]

        ConfigEditConflictError ->
            [ Text "Someone else changed the configuration before you, your change was not saved." ]

        UnprivilegedError ->
            [ Text "Você não tem os privilégios para fazer isto." ]

        GameNotStartedError ->
            [ Text "O jogo deve ser reiniciado para fazer isto." ]

        InvalidActionError { reason } ->
            [ Text "O servidor não entendeu a requisição do cliente. Detalhes: ", Text reason ]

        AuthenticationError ->
            [ Text "Você não pode entrar nesse jogo." ]

        IncorrectIssuerError ->
            [ Text "Suas credenciais estão desatualizadas, o jogo não existe mais." ]

        InvalidAuthenticationError ->
            [ Text "Suas credenciais estão com problema." ]

        InvalidLobbyPasswordError ->
            [ Text "A senha está incorreta. Tente outra vez ou pergunte a quem te enviou." ]

        AlreadyLeftError ->
            [ Text "Você já saiu do jogo." ]

        LobbyNotFoundError ->
            [ Text "O jogo não existe." ]

        LobbyClosedError { gameCode } ->
            [ Text "O jogo (", Ref (GameCode { code = gameCode }), Text ") já acabou." ]

        LobbyDoesNotExistError { gameCode } ->
            [ Text "The game code you entered ("
            , Ref (GameCode { code = gameCode })
            , Text ") doesn't exist. "
            , Text "Try typing it again and if it still doesn't work, ask the person who invited you again."
            ]

        RegistrationError ->
            [ Text "Problem while joining the game." ]

        UsernameAlreadyInUseError { username } ->
            [ Text "Alguém já está sando este nome “"
            , Text username
            , Text "”—tente um nome diferente."
            ]

        GameError ->
            [ Text "Alguma coisa deu errado." ]

        OutOfCardsError ->
            [ Text "There were not enough cards in the deck to deal everyone a hand! Try adding more decks in the game configuration." ]

        -- Language Names
        English ->
            [ Text "English" ]

        BritishEnglish ->
            [ Text "English (British)" ]

        Português ->
                [ Text "Português" ]


an : Maybe Int -> String
an amount =
    case amount of
        Just 1 ->
            "uma "

        _ ->
            ""


a : Maybe Int -> String
a amount =
    case amount of
        Just 1 ->
            "uma "

        _ ->
            ""


{-| Take a number and give back the name of that number. Falls back to the number when it gets too big.
-}
asWord : Int -> String
asWord number =
    case number of
        0 ->
            "zero"

        1 ->
            "um"

        2 ->
            "dois"

        3 ->
            "três"

        4 ->
            "quatro"

        5 ->
            "cinco"

        6 ->
            "seis"

        7 ->
            "sete"

        8 ->
            "oito"

        9 ->
            "nove"

        10 ->
            "dez"

        11 ->
            "onze"

        12 ->
            "doze"

        other ->
            String.fromInt other
