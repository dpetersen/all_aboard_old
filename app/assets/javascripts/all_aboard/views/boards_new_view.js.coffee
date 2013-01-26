App.BoardsNewView = Ember.View.extend
  submit: (event) ->
    event.preventDefault()
    @get("controller").createBoard()
