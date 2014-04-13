class @Player_one extends @Player
  constructor: (@game, @player_id) ->
    @rect = @game.board.append("rect").
      style("fill", "black").
      attr("width", 30).
      attr("height", 150).
      attr("x", 0).
      attr("y", 0)
  base: ->
    @width

  set: (y)->
    @y += y
    Matches.update({_id: @game.match._id},{ $set: { "player_1.y": @y}})
