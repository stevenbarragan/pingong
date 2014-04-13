class @Game
  constructor : (@match)->
    @width = 950
    @heigt = 450

    @board = d3.select('#board').
      append("svg").
      attr("width", @with).
      attr("height", @heigt)

    @ball = new Ball(@, @match)

    window.ball = @ball

    @player1 = new Player_one(@, 'player_1')
    @player2 = new Player_two(@, 'player_2')

  start: ->
    if window.player == 'player_1'
      @ball.move()
      @check_player_2()
    else
      @check()
      @check_player_1()

  check: ->
    Deps.autorun ->
      model = Matches.findOne(match._id)
      window.ball.update(model.ball.x, model.ball.y)

  check_player_1: ->
    Deps.autorun ->
      model = Matches.findOne(match._id)
      console.log model
      window.game.player1.move( model.player_1.y )

  check_player_2: ->
    Deps.autorun ->
      model = Matches.findOne(match._id)
      console.log model
      window.game.player2.move( model.player_2.y )
