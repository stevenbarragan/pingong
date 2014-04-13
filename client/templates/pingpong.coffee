Meteor.subscribe 'matches', ->
  unless match?
    count = Matches.find("player_2._id": null).count()

    if count > 0
      window.player = 'player_2'

      match_id = Matches.findOne("player_2._id": null)._id

      Matches.update {_id: match_id},
        $set: 
          "player_2._id": Meteor.userId()
    else
      window.player = 'player_1'

      match_id = Matches.insert
        player_1:
          _id: Meteor.userId()
          y: 0
        player_2:
          _id: null
          y: 0
        ball:
          x: 450
          y: 200

    window.match_id = match_id

    console.log 'Im ' + window.player

    window.match = Matches.findOne({_id: match_id })

    Deps.autorun ->
      if Matches.findOne({_id: window.match_id}).player_2._id
        unless window.game
          $(document).ready ->
            window.game = new Game window.match

            if window.player == 'player_1'
              d3.select('body').
                on 'keydown', () =>
                  switch d3.event.keyCode
                    when 38 then game.player1.up()
                    when 40 then game.player1.down()
            else
              d3.select('body').
                on 'keydown', () =>
                  switch d3.event.keyCode
                    when 38 then game.player2.up()
                    when 40 then game.player2.down()
