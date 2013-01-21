App.BoardsNewController = Ember.ObjectController.extend
  initializeNewBoard: ->
    if !@transaction
      @transaction = App.store.transaction()
      @set("content", @transaction.createRecord(App.Board))

  createBoard: ->
    @transaction.commit()
    @transaction = null
    @get("content").addObserver("id", this, "showRecord")

  showRecord: ->
    newRecord = @get("content")
    newRecord.removeObserver("id", this, "showRecord")
    @controllerFor("board").transitionTo("board", newRecord)
