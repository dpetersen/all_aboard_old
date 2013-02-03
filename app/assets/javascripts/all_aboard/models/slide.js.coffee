App.Slide = DS.Model.extend
  board: DS.belongsTo("App.Board")
  layout: DS.belongsTo("App.Layout")
  panes: DS.hasMany("App.Pane")

  possiblePanes: Em.computed ->
    return [] unless @get("layout.paneCount")

    [1..@get("layout.paneCount")].map (paneNumber) =>
      o = { number: paneNumber }
      o.pane = @get("panes").objectAt(paneNumber - 1) || null
      o
  .property("panes", "layout.paneCount")
