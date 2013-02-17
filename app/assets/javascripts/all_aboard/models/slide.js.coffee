App.Slide = DS.Model.extend
  board: DS.belongsTo("App.Board")
  layout: DS.belongsTo("App.Layout")
  panes: DS.hasMany("App.Pane")

  # There won't be database records for unassigned panes, but we do want to
  # render a placeholder so that interface looks right.  There has to be a
  # better solution.
  possiblePanes: Em.computed ->
    return [] unless @get("layout.paneCount")

    [1..@get("layout.paneCount")].map (paneNumber) =>
      o = { number: paneNumber }
      o.pane = @get("panes").objectAt(paneNumber - 1) || null
      o
  .property("panes", "layout.paneCount")
