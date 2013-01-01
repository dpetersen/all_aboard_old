App.Router = Ember.Router.extend
  location: "history"
  rootURL: App.baseRoute

  root: Ember.Route.extend
    boards: Ember.Route.extend
      route: "/boards"

      index: Ember.Route.extend
        route: "/"
        connectOutlets: (router) ->
          router.get("applicationController").connectOutlet("boards", App.store.findAll(App.Board))
          router.get("boardsController").connectOutlet("newBoard", "newBoard")
          router.get("newBoardController").initializeNewBoard()
        showBoard: Ember.Route.transitionTo("board")

      board: Ember.Route.extend
        route: "/:board_id"
        connectOutlets: (router, board) ->
          router.get("applicationController").connectOutlet("board", board)
        showBoardList: Ember.Router.transitionTo("boards.index")
