App.SourceData = DS.Model.extend
  dataObject: DS.attr("readOnlyObject")

App.SourceData.reopenClass
  getUpdatesFor: (board) ->
    # Can you use the adapter load thing that is mentioned in breaking changes?
    $.getJSON(
      App.updateRoute,
      since: board.get("latestTimestamp"),
      (response) => @updateReceived(board, response)
    )

  updateReceived: (board, response) ->
    board.set("latestTimestamp", response.latest_timestamp)
    response.updates.forEach (update) =>
      @processUpdate(JSON.parse(update))

  processUpdate: (update) ->
    console.info "Got update for", update.id, "with object", update.data_object
    App.SourceData.find(update.id).set("dataObject", update.data_object)
