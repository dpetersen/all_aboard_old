App.BoardsNewController = Ember.ObjectController.extend
  needs: [ "board" ]

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
    @get("controllers.board").transitionToRoute("board", newRecord)
