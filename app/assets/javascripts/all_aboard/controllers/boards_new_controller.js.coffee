App.BoardsNewController = Ember.ObjectController.extend
  initializeNewBoard: ->
    if !@transaction
      @transaction = App.store.transaction()
      @set("model", @transaction.createRecord(App.Board))

  createBoard: ->
    @transaction.commit()
    @transaction = null
    @get("model").addObserver("id", this, "showRecord")

  showRecord: ->
    newRecord = @get("model")
    newRecord.removeObserver("id", this, "showRecord")
    @controllerFor("board").transitionTo("board", newRecord)
