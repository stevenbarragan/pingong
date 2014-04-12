class @Player
  width: 30
  height: 150
  y: 0
  up: ->
    if @y > 0
      @y -= 75
      @rect.transition().
        attr('y', @y).
        duration(100)

  down: ->
    if @y < 300
      @y += 75
      @rect.transition().
        duration(100).
        attr('y', @y)

  in_range: (y)->
    y >= @y && y <= @y + @height
