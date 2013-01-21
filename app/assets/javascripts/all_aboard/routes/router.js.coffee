App.Router.reopen
  location: 'history'
  # TODO: This should be dynamic, based on where the engine is actually mounted.
  # Should be able to use this in place of the "/all_aboard" calls below.
  # rootURL: '/all_aboard'

App.Router.map (match) ->
  @route("home", path: "/all_aboard/")

  @resource("boards", path: "/all_aboard/boards", ->
    @route("new")
  )

  @resource("board", path: "/all_aboard/board/:board_id", ->
    @resource("slides", ->
      @route("new")
    )
  )

App.HomeRoute = Em.Route.extend
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
