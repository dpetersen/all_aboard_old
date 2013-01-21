App.Board = DS.Model.extend
  slides: DS.hasMany("App.Slide")
  name: DS.attr("string")
  latestTimestamp: DS.attr("number")
