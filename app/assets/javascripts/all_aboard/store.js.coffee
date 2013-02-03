DS.RESTAdapter.registerTransform("readOnlyObject",
  serialize: (value) ->
    value

  deserialize: (value) ->
    value
)

App.ServerAdapter = DS.RESTAdapter.extend()
App.ServerAdapter.map("App.Board", slides: { embedded: "always" })
App.ServerAdapter.map("App.Slide", panes: { embedded: "always" })
App.ServerAdapter.map("App.Pane", sourceData: { embedded: "always" })

App.Store = DS.Store.extend
  revision: 11
  adapter: App.ServerAdapter.create
    namespace: App.storeRoute

App.Store.registerAdapter("App.Layout", DS.FixtureAdapter.extend())

App.store = App.Store.create()
