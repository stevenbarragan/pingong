class @Player
  pos_y: 0
  up: ->
    if @pos_y > 0
      @pos_y -= 25
      @rect.transition().
        attr('y', @pos_y).
        duration(100)

  down: ->
    if @pos_y < 300
      @pos_y += 25
      @rect.transition().
        duration(100).
        attr('y', @pos_y)
