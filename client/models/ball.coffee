class @Ball
  constructor: (@game) ->
    @angle = 0
    @direction = 1
    @x = 450
    @y = 200

    @circle = @game.board.append("circle").
      style('fill', 'black').
      attr('cx', @x).
      attr('cy', @y).
      attr('r', 20)

  start: ->
    @move()

  move: ->
    x = Math.cos(@angle) * @direction
    y = Math.sin(@angle) * @direction

    if @no_crash(x, y)
      @x += x
      @y += y
      @animate()
    else
      @direction *= -1
      console.log('crash')

  animate: =>
    @circle.transition().
      duration(1250).
      attr('cx', @x).
      attr('cy', @y).
      each('end', =>
        @move()
      )

    @move()

  no_crash: (x,y)->
    new_x = @x + x
    new_y = @y + y

    new_x >= 0 && new_x <= 900 && new_y >= 0 && new_y <= 400
