Template.pingpong.rendered = ->
  @game = new Game

  @game.ball.start()

  d3.select('body').
    on('keydown', () =>
      switch d3.event.keyCode
        when 87 then @game.player1.up()
        when 83 then @game.player1.down()
        when 38 then @game.player2.up()
        when 40 then @game.player2.down()
    )
