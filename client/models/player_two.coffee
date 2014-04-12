class @Player_two extends @Player
  constructor: (@game) ->
    @rect = @game.board.append("rect").
      style("fill", "black").
      attr("width", 30).
      attr("height", 100).
      attr("x", 870).
      attr("y", 0)
  base: ->
    @game.width - @width

