DS.RESTAdapter.map("App.Board",
  latestTimestamp:
    key: "latest_timestamp"
)

App.Board = DS.Model.extend
  slides: DS.hasMany('App.Slide', embedded: true)
  name: DS.attr("string")
  latestTimestamp: DS.attr("number")
