class @Player
  width: 30
  height: 150
  y: 0
  up: ->
    if @y > 0
      @set(-75)
      @update()

  down: ->
    if @y < 300
      @set(75)
      @update()

  update: ->
    @rect.transition().
      duration(100).
      attr('y', @y)

  move: (y)->
    @y = y
    @update()

  in_range: (y)->
    y >= @y && y <= @y + @height
