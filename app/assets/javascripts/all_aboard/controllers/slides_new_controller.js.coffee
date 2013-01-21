App.SlidesNewController = Ember.ObjectController.extend
  initializeNewSlideFor: (board) ->
    if !@transaction
      @transaction = App.store.transaction()
      slide = @transaction.createRecord(App.Slide)
      slide.set("board", board)
      @set("content", slide)

  createSlide: ->
    @transaction.commit()
    @transaction = null
    @get("content").addObserver("id", this, "showRecord")

  showRecord: ->
    newRecord = @get("content")
    newRecord.removeObserver("id", this, "showRecord")
    @initializeNewSlideFor(newRecord.get("board"))
