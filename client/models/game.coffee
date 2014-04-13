class @Game
  constructor : ()->
    @width = 950
    @heigt = 450

    @board = d3.select('#board').
      append("svg").
      attr("width", @with).
      attr("height", @heigt)

    model = Matches.findOne()
    @ball = new Ball(@, model)

    window.ball = @ball

    @player1 = new Player_one(@)
    @player2 = new Player_two(@)

  check: ->
    Deps.autorun ->
      model = Matches.findOne()
      window.ball.update(model.ball.x, model.ball.y)

