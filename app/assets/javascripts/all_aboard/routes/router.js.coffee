App.Router = Ember.Router.extend
  location: "history"

  root: Ember.Route.extend
    board: Ember.Route.extend
      # FIXME: Cannot get rootURL to work to save my life.
      route: "#{App.baseRoute}/boards/:board_id"
      connectOutlets: (router, board) ->
        router.get("applicationController").connectOutlet("board", board)

      index: Ember.Route.extend
        route: "/"
        showSettings: (router) ->
          router.transitionTo("settings")

      settings: Ember.Route.extend
        route: "/settings"
        connectOutlets: (router) ->
          router.get("boardController").connectOutlet("settings", "settings")
