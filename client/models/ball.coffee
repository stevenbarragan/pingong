class @Ball
  constructor: (@game, @match) ->
    @angle = Math.PI / 4
    @direction_x = 1
    @direction_y = 1
    @x = 450
    @y = 200
    @r = 20

    @circle = @game.board.append("circle").
      style('fill', 'black').
      attr('cx', @match.ball.x).
      attr('cy', @match.ball.y).
      attr('r', @r)

  set: (x,y)->
    Matches.update(_id: @match._id, {$set: {ball: {x: x, y: y}}})
    @x = x
    @y = y

  start: ->
    @move()

  update: (x, y) ->
    @x = x
    @y = y
    @circle.transition().
      duration(5).
      attr('cx', @x).
      attr('cy', @y)

  move: ->
    x = Math.cos(@angle) * 10 * @direction_x
    y = Math.sin(@angle) * 10 * @direction_y

    new_x = @x + x
    new_y = @y + y

    if @crash_top(new_y) || @crash_bot(new_y)
      @direction_y *= -1
      @move()
    else
      if @direction_x > 0
        if @crash_right_player(new_x, new_y)
          @direction_x = -1
          @move()
        else
          if @crash_right(new_x)
            console.log 'player 2 lost'
            @direction_x = -1
            @move()
          else
            @set(new_x, new_y)
            @animate()
      else
        if @crash_left_player(new_x, new_y)
          @direction_x = 1
          @move()
        else
          if @crash_left(new_x)
            console.log 'player 1 lost'
            @direction_x = 1
            @move()
          else
            @set(new_x, new_y)
            @animate()

  crash_top: (y)->
    y < 0

  crash_bot: (y) ->
    y > 400

  crash_left_player: (x,y) ->
    @game.player1.in_range(y) && x < @game.player1.base()

  crash_left: (x) ->
    x < 0

  crash_right_player: (x, y) ->
    @game.player2.in_range(y) && x > @game.player2.base()

  crash_right: (x) ->
    x > @game.width

  animate: =>
    @circle.transition().
      duration(5).
      attr('cx', @x).
      attr('cy', @y).
      each('end', ->
        ball.move()
      )

