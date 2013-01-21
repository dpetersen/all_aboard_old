App.BoardController = Ember.ObjectController.extend
  setUpdateTimer: ->
    @timeout = setTimeout((=> @requestUpdate()), 2000)

  requestUpdate: ->
    if @get("isLoaded")
      App.SourceData.getUpdatesFor(@content)
      @setUpdateTimer()

  clearUpdateTimer: ->
    clearTimeout(@timeout)
