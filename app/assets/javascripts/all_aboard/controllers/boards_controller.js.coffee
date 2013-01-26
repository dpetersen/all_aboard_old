App.BoardsController = Ember.ArrayController.extend
  sortProperties: [ 'name' ]

  persistedBoards: Ember.computed ->
    @get("arrangedContent").filterProperty("isNew", false)
  .property("arrangedContent.@each").cacheable()
