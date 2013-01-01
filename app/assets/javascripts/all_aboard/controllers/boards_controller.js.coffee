App.BoardsController = Ember.ArrayController.extend
  sortProperties: [ 'name' ]

  persistedBoards: ( ->
    @get("arrangedContent").filterProperty("isNew", false)
  ).property("arrangedContent.@each").cacheable()
