Template.pingpong.rendered = ->
  player1 = new Player
  player2 = new Player
  window.ball = new Ball

  @board = d3.select('#board').
    append("svg").
    attr("width", 900).
    attr("height", 400)

  player1.rect = @board.append("rect").
    style("fill", "black").
    attr("width", 30).
    attr("height", 100).
    attr("x", 0).
    attr("y", 0)

  player2.rect = @board.append("rect").
    style("fill", "black").
    attr("width", 30).
    attr("height", 100).
    attr("x", 870).
    attr("y", 0)

  window.ball.circle = @board.append("circle").
    style('fill', 'black').
    attr('cx', 450).
    attr('cy', 200).
    attr('r', 20)

  d3.select('body').
    on('keydown', ()->
      switch d3.event.keyCode
        when 38 then player1.up()
        when 40 then player1.down()
        when 87 then player2.up()
        when 83 then player2.down()
        else console.log d3.event.keyCode
    )
