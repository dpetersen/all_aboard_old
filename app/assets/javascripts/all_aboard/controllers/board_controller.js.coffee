App.BoardController = Ember.ObjectController.extend
  boardLoaded: ( ->
    if @get("isLoaded")
      @setUpdateTimer()
  ).observes("isLoaded")

  setUpdateTimer: ->
    setTimeout((=> @requestUpdate()), 2000)

  requestUpdate: ->
    App.SourceData.getUpdatesFor(@content)
    @setUpdateTimer()
