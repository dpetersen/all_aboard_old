App.Slide = DS.Model.extend
  board: DS.belongsTo("App.Board")
  layoutName: DS.attr("string")
  #panes: DS.hasMany("App.Pane")
  #markup: DS.attr("string")
