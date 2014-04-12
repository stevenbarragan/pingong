class @Ball
  constructor: (@game) ->
    @angle = Math.PI / 4
    @direction_x = 1
    @direction_y = 1
    @x = 450
    @y = 200
    @r = 20

    @circle = @game.board.append("circle").
      style('fill', 'black').
      attr('cx', @x).
      attr('cy', @y).
      attr('r', @r)

  start: ->
    @move()

  move: ->
    x = Math.cos(@angle) * 10 * @direction_x
    y = Math.sin(@angle) * 10 * @direction_y

    new_x = @x + x
    new_y = @y + y

    if @crash_top(new_y) || @crash_bot(new_y)
      @direction_y *= -1
      @move()
    else
      if @crash_left(new_x, new_y) || @crash_right(new_x, new_y)
        console.log 'crash left'
        @direction_x *= -1
        @move()
      else
        @x = new_x
        @y = new_y
        @animate()

  crash_top: (y)->
    y < 0

  crash_bot: (y) ->
    y > 400

  crash_left: (x,y) ->
    min_x = 0
    min_x = @game.player1.base() + @r if @game.player1.in_range(y)
    x < min_x

  crash_right: (x,y) ->
    max_x = @game.width
    max_x = @game.player2.base() - @r if @game.player2.in_range(y)
    x > max_x

  animate: =>
    @circle.transition().
      duration(5).
      attr('cx', @x).
      attr('cy', @y).
      each('end', ->
        ball.move()
      )

