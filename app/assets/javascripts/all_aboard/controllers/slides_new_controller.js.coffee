App.SlidesNewController = Ember.ObjectController.extend
  initializeNewSlideFor: (board) ->
    if !@transaction
      @transaction = App.store.transaction()
      slide = @transaction.createRecord(App.Slide)
      slide.set("board", board)
      @set("model", slide)

  createSlide: ->
    @transaction.commit()
    @transaction = null
    @get("model").addObserver("id", this, "showRecord")

  showRecord: ->
    newRecord = @get("model")
    newRecord.removeObserver("id", this, "showRecord")
    @initializeNewSlideFor(newRecord.get("board"))
