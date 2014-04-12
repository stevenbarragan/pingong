class @Player_one extends @Player
  constructor: (@game) ->
    @rect = @game.board.append("rect").
      style("fill", "black").
      attr("width", 30).
      attr("height", 100).
      attr("x", 0).
      attr("y", 0)
