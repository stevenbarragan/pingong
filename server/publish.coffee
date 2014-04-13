Matches = new Meteor.Collection 'matches'

Matches.allow
  insert: -> true
  update: -> true

Meteor.publish 'matches', ->
  Matches.find()
