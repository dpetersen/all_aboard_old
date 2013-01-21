App.BoardsNewView = Ember.View.extend
  templateName: "all_aboard/templates/boards_new"

  submit: (event) ->
    event.preventDefault()
    @get("controller").createBoard()
