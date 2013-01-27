App.Router.reopen
  location: 'history'
  rootURL: App.baseRoute

App.Router.map (match) ->
  @resource("boards")

  @resource("board", path: "/board/:board_id", ->
    @resource("slides")
  )

App.IndexRoute = Em.Route.extend
  redirect: ->
    @transitionTo("boards")

App.BoardRoute = Em.Route.extend
  setupController: (controller, board) ->
    controller.set("content", board)
  enter: ->
    @controllerFor("board").setUpdateTimer()
  exit: ->
    @controllerFor("board").clearUpdateTimer()

App.BoardsRoute = Em.Route.extend
  setupController: (controller) ->
    controller.set("content", App.Board.find())
    @controllerFor("boards.new").initializeNewBoard()

App.SlidesRoute = Em.Route.extend
  setupController: (controller) ->
    parentBoard = @controllerFor("board").get("content")

    controller.set("content", parentBoard.get("slides"))
    @controllerFor("slides.new").initializeNewSlideFor(parentBoard)

App.SlidesController = Ember.ArrayController.extend()
App.SlideController = Ember.ObjectController.extend()
