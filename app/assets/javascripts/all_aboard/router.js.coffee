App.Router.reopen
  location: 'history'
  rootURL: App.baseRoute

App.Router.map (match) ->
  @resource("boards", ->
    @route("new")
  )

  @resource("board", path: "/board/:board_id", ->
    @resource("slides", ->
      @route("new")
    )
  )

App.IndexRoute = Em.Route.extend
  redirect: ->
    @transitionTo("boards.new")

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

App.BoardsNewRoute = Em.Route.extend
  setupController: (controller) ->
    controller.initializeNewBoard()

App.BoardSubroute = Em.Route.extend
  parentBoard: ->
    @controllerFor("board").get("content")

App.SlidesRoute = App.BoardSubroute.extend
  setupController: (controller) ->
    controller.set("content", @parentBoard().get("slides"))

App.SlidesNewRoute = App.BoardSubroute.extend
  setupController: (controller) ->
    controller.initializeNewSlideFor(@parentBoard())

App.SlidesController = Ember.ArrayController.extend()
App.SlideController = Ember.ObjectController.extend()
