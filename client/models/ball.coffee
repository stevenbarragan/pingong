class @Ball
  constructor: (@game) ->
    @angle = 0
    @direction = 1
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
    x = Math.cos(@angle) * @direction * 10
    y = Math.sin(@angle) * @direction * 10

    if @no_crash(x, y)
      @x += x
      @y += y
      @animate()
    else
      @direction *= -1
      @move()

  no_crash: (x,y)->
    new_x = @x + x
    new_y = @y + y

    max_x = @game.width
    min_x = 0

    max_x = @game.player2.base() - @r if @game.player2.in_range(new_y)
    min_x = @game.player1.base() + @r if @game.player1.in_range(new_y)

    new_x >= min_x && new_x <= max_x && new_y >= 0 && new_y <= 400

  animate: =>
    @circle.transition().
      duration(5).
      attr('cx', @x).
      attr('cy', @y).
      each('end', ->
        ball.move()
      )

