App.Slide = DS.Model.extend
  panes: DS.hasMany("App.Pane", embedded: true)
  markup: DS.attr("string")
