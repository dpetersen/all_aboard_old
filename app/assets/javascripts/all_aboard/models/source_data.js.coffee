DS.RESTAdapter.map("App.SourceData",
  dataObject:
    key: "data_object"
)

App.SourceData = DS.Model.extend
  dataObject: DS.attr("readOnlyObject")

App.SourceData.reopenClass
  getUpdatesFor: (board) ->
    $.getJSON(
      App.updateRoute,
      since: board.get("latestTimestamp"),
      (response) => @updateReceived(board, response)
    )

  updateReceived: (board, response) ->
    # update looks like:
    # {"updates":["{"id":"TimeSource","data_object":{"current_time":"21 Jan 02:40"}}"],"latest_timestamp":1358736052.0}
    board.set("latestTimestamp", response.latest_timestamp)
    response.updates.forEach (update) =>
      @processUpdate(JSON.parse(update))

  processUpdate: (update) ->
    console.info "Got update for", update.id, "with object", update.data_object
    # TODO: This now fetches an object from the server (or tries).  Not sure how it used to work.
    #sourceData = App.store.find(App.SourceData, update.id)
    #sourceData.set("dataObject", update.data_object)
