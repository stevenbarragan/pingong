class @Game
  constructor : ()->
    @board = d3.select('#board').
      append("svg").
      attr("width", 900).
      attr("height", 400)

    @ball = new Ball(@)

    @player1 = new Player_one(@)
    @player2 = new Player_two(@)
