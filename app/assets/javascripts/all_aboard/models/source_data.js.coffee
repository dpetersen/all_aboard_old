App.SourceData = DS.Model.extend
  dataObject: DS.attr("readOnlyObject", key: "data_object")

App.SourceData.reopenClass
  getUpdatesFor: (board) ->
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
    sourceData = App.store.find(App.SourceData, update.id)
    sourceData.set("dataObject", update.data_object)
