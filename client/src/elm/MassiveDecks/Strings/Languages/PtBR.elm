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
            [ Text "Decks Enormes" ]

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
            [ Text "O que é o ", Ref MassiveDecks, Text "?" ]

        GameDescription ->
            [ Ref MassiveDecks
            , Text " é um jogo de comédia baseado no "
            , Ref CardsAgainstHumanity
            , Text ", desenvolvido por "
            , Ref RereadGames
            , Text " e outros contribuidores — esse jogo é de código aberto sob "
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
            [ Text "A ", Ref Call, Text " e um ", Ref Response, Text " marcado com um “M” e um “D”." ]

        RereadLogoDescription ->
            [ Text "Um livro circulado por uma seta de reciclagem." ]

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
            [ Text "Entrar novamente no jogo" ]

        RejoinGame { code } ->
            [ Text "Entrar novamente “", GameCode { code = code } |> Ref, Text "”." ]

        LobbyRequiresPassword ->
            [ Text "Você precisa de uma senha para entrar neste jogo. Pergunte a pessoa que te convidou." ]

        YouWereKicked ->
            [ Text "Você foi expulso do jogo." ]

        -- Rules
        CardsAgainstHumanity ->
            [ Text "Cards Against Humanity" ]

        Rules ->
            [ Text "Como jogar." ]

        RulesHand ->
            [ Text "Cada jogador têm uma mão de ", Ref (Plural { singular = Response, amount = Nothing }), Text "." ]

        RulesCzar ->
            [ Text "O primeiro jogador começa como o "
            , Ref Czar
            , Text ". o "
            , Ref Czar
            , Text " lê a questão ou frase para preencher as lacunas na "
            , Ref Call
            , Text " para os outros jogadores."
            ]

        RulesPlaying ->
            [ Text "Todos os outros respondem a questão ou preenchem a lacuna escolhendo uma "
            , Ref Response
            , Text " para jogar na rodada."
            ]

        RulesJudging ->
            [ Text "As respostas são embaralhadas e então o "
            , Ref Czar
            , Text " as lê para os demais jogadores — de preferência, o "
            , Ref Czar
            , Text " deve ler novamente a "
            , Ref Call
            , Text " antes de cada resposta. O "
            , Ref Czar
            , Text " então escolhe a resposta mais divertida, e quem a jogou ganha um "
            , Ref Point
            , Text "."
            ]

        RulesPickTitle ->
            [ Ref (Pick { numberOfCards = 2 }) ]

        RulesPick ->
            [ Text "Algumas cartas vão precisar de mais de uma "
            , Ref Response
            , Text " como resposta. Jogue as cartas na ordem em que o "
            , Ref Czar
            , Text " dever ler — a ordem é importante!."
            ]

        ExamplePickDescription ->
            [ Ref (Plural { singular = Call, amount = Nothing })
            , Text " como esta requerem pegar mais "
            , Ref (Plural { singular = Response, amount = Nothing })
            , Text ", mas te dão mais opções para escolher."
            ]

        RulesDraw ->
            [ Text "Algumas "
            , Ref (Plural { singular = Call, amount = Nothing })
            , Text " vão precisar de ainda mais "
            , Ref (Plural { singular = Response, amount = Nothing })
            , Text " — essas vão dizer "
            , Ref (Draw { numberOfCards = 2 })
            , Text " ou mais, e você deve receber esta quantidade de cartas antes da sua jogada."
            ]

        GameRulesTitle ->
            [ Text "Regras do Jogo" ]

        HouseRulesTitle ->
            [ Text "Regras da Casa" ]

        HouseRules ->
            [ Text "Você pode mudar a maneira como o jogo é jogado de várias formas. Nas configurações escolha "
            , Text "quantas regras da cada você quiser usar."
            ]

        HouseRuleReboot ->
            [ Text "Resetando o universo" ]

        HouseRuleRebootDescription { cost } ->
            [ Text "A qualquer momento do jogo os jogadores poderão trocar "
            , Text (an cost)
            , Ref (Plural { singular = Point, amount = cost })
            , Text " para descartar a sua mão e pegar uma nova."
            ]

        HouseRuleRebootAction { cost } ->
            [ Text "Gastar "
            , Text (asWord cost)
            , Text " "
            , Ref (Plural { singular = Point, amount = Just cost })
            , Text " para descartar a sua mão e pegar uma nova."
            ]

        HouseRuleRebootCost ->
            [ Ref Point, Text "s necessários" ]

        HouseRuleRebootCostDescription ->
            [ Text "Quantos ", Ref (Plural { singular = Point, amount = Nothing }), Text " custa para trocar a mão." ]

        HouseRulePackingHeat ->
            [ Text "Portador de Armas" ]

        HouseRulePackingHeatDescription ->
            [ Text "Qualquer "
            , Ref (Plural { singular = Call, amount = Nothing })
            , Text " com "
            , Ref (Pick { numberOfCards = 2 })
            , Text " também dá direito a "
            , Ref (Draw { numberOfCards = 1 })
            , Text ", para que todos tenham mais opções."
            ]

        HouseRuleComedyWriter ->
            [ Text "Modo Comediante" ]

        HouseRuleComedyWriterDescription ->
            [ Text "Adiciona "
            , Ref (Plural { singular = Response, amount = Nothing })
            , Text " vazias onde os jogadores podem criar respostas customizadas."
            ]

        HouseRuleComedyWriterNumber ->
            [ Ref (Plural { singular = Response, amount = Nothing }), Text " vazias", ]

        HouseRuleComedyWriterNumberDescription ->
            [ Text "Número de "
            , Ref (Plural { singular = Response, amount = Nothing })
            , Text " vazias que estarão disponíveis no jogo."
            ]

        HouseRuleComedyWriterExclusive ->
            [ Text "Apenas ", Ref (Plural { singular = Response, amount = Nothing }), Text " vazias." ]

        HouseRuleComedyWriterExclusiveDescription ->
            [ Text "Se ativado, todas as outras "
            , Ref (Plural { singular = Response, amount = Nothing })
            , Text " serão ignoradas, e apenas cartas vazias aparecerão no jogo."
            ]

        HouseRuleRandoCardrissian ->
            [ Text "Rando Cardrissian" ]

        HouseRuleRandoCardrissianDescription ->
            [ Text "A cada rodada, a primeira "
            , Ref Response
            , Text " no deck será jogada como resposta. Esta jogada pertence a um jogador chamado "
            , Text "Rando Cardrissian, e se ele ganhar a partida, todos os jogadores serão humilhados para sempre."
            ]

        HouseRuleRandoCardrissianNumber ->
            [ Text "Jogadores controlados pelo computador" ]

        HouseRuleRandoCardrissianNumberDescription ->
            [ Text "Número de jogadores controlados pelo computador que estarão neste jogo." ]

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
            [ Text "Cartas compactas" ]

        CardSizeExplanation ->
            [ Text "Ajuste o tamanho das castas — útil em telas pequenas para evitar a rolagem." ]

        SpeechSetting ->
            [ Text "Text to Speech" ]

        SpeechExplanation ->
            [ Text "Lê as cartas usando text to speech." ]

        SpeechNotSupportedExplanation ->
            [ Text "Seu navegador não suporta text to speech, ou não tem nenhuma voz instalada." ]

        VoiceSetting ->
            [ Text "Speech Voice" ]

        NotificationsSetting ->
            [ Text "Notificações no navegador" ]

        NotificationsExplanation ->
            [ Text "Alerta quando você precisa fazer algo no jogo usando uma notificação no navegador."
            ]

        NotificationsUnsupportedExplanation ->
            [ Text "Seu navegador não suporta notificações." ]

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
            [ Text "Jogar" ]

        BecomePlayerDescription ->
            [ Text "Jogar nessa partida." ]

        EndGame ->
            [ Text "Terminar partida" ]

        EndGameDescription ->
            [ Text "Termina a partida agora." ]

        ReturnViewToGame ->
            [ Text "Voltar" ]

        ReturnViewToGameDescription ->
            [ Text "Volter para a tela principal do jogo." ]

        ViewConfgiuration ->
            [ Text "Configurar" ]

        ViewConfgiurationDescription ->
            [ Text "Veja as configurações do jogo." ]

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
            [ Segment [ Text "Nenhum deck. " ]
            , Text " "
            , Segment [ Text "Você vai precisar de pelo menos um deck para jogar." ]
            ]

        NoDecksHint ->
            [ Text "Não tem certeza do que fazer? Adicione o deck de ", Raw CardsAgainstHumanity ]

        WaitForDecks ->
            [ Text "Os decks precisam ser carregados antes de iniciar a partida." ]

        MissingCardType { cardType } ->
            [ Text "OS seus decks não contém nenhuma "
            , Ref (Plural { singular = cardType, amount = Nothing })
            , Text ". Você precisa de um deck com cartas para iniciar o jogo."
            ]

        NotEnoughCardsOfType { cardType, needed, have } ->
            [ Text "Para o número de jogadores na partida, você precisa de no mínimo "
            , Text (needed |> String.fromInt)
            , Text " "
            , Ref (Plural { singular = cardType, amount = Just needed })
            , Text " mas você tem apenas "
            , Text (have |> String.fromInt)
            , Text "."
            ]

        AddDeck ->
            [ Text "Adicionar deck." ]

        RemoveDeck ->
            [ Text "Remover deck." ]

        SourceNotFound { source } ->
            [ Ref source, Text " não reconhece o deck que você adicionou. Verifique se os detalhes estão corretos." ]

        SourceServiceFailure { source } ->
            [ Ref source, Text " carregamento do deck falhou. Tente mais tarde ou de outra fonte." ]

        Cardcast ->
            [ Text "Cardcast" ]

        CardcastPlayCode ->
            [ Text " código do deck ", Ref Cardcast  ]

        CardcastEmptyPlayCode ->
            [ Text "Digite o ", Ref CardcastPlayCode, Text " para o adicionar." ]

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
            [ Text "Limite de ", Ref Point ]

        ScoreLimitDescription ->
            [ Segment
                [ Text "O número de "
                , Ref (Plural { singular = Point, amount = Nothing })
                , Text " que um jogador precisa para ganhar a partida."
                ]
            , Text " "
            , Segment [ Text "Se esta opção for desativada o jogo continuará indefinidamente." ]
            ]

        UnsavedChangesWarning ->
            [ Text "You have unsaved changes to the configuration, they must be saved first if you want them to apply "
            , Text "to the game."
            ]

        SaveChanges ->
            [ Text "Salvar suas mudanças." ]

        RevertChanges ->
            [ Text "Descartar mudanças não salvas." ]

        NeedAtLeastOneDeck ->
            [ Text "Você precisa adicionar um deck de cartas para iniciar a partida." ]

        NeedAtLeastThreePlayers ->
            [ Text "Você precisa de pelo menos 3 jogadores para iniciar a partida." ]

        NeedAtLeastOneHuman ->
            [ Text "Infelizmente jogadores controlados pelo computador não podem ser o "
            , Ref Czar
            , Text ", então você precisa de no mínimo um humano para iniciar a partida."
            , Text " (Se bem que com apenas um humano vai ser chato!)"
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
