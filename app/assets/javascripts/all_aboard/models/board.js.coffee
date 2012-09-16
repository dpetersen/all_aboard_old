App.Board = DS.Model.extend
  slides: DS.hasMany('App.Slide', embedded: true)
  name: DS.attr("string")
  latestTimestamp: DS.attr("number", key: "latest_timestamp")
