class @Player
  width: 30
  height: 100
  y: 0
  up: ->
    if @y > 0
      @y -= 25
      @rect.transition().
        attr('y', @y).
        duration(75)

  down: ->
    if @y < 300
      @y += 25
      @rect.transition().
        duration(75).
        attr('y', @y)

  in_range: (y)->
    y >= @y && y <= @y + @height
