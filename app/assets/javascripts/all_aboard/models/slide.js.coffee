App.Slide = DS.Model.extend
  board: DS.belongsTo("App.Board")
  #panes: DS.hasMany("App.Pane")
  #markup: DS.attr("string")
