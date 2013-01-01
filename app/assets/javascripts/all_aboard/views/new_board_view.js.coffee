App.NewBoardView = Ember.View.extend
  templateName: "all_aboard/templates/new_board"

  submit: (event) ->
    event.preventDefault()
    @get("controller").createBoard()
