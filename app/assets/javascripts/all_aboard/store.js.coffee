DS.RESTAdapter.registerTransform("readOnlyObject"
  serialize: (value) ->
    value

  deserialize: (value) ->
    value
)

App.Adapter = DS.RESTAdapter.extend()
App.Adapter.map("App.Board", slides: { embedded: "always" })
App.Adapter.map("App.Slide", panes: { embedded: "always" })
App.Adapter.map("App.Pane", sourceData: { embedded: "always" })

App.store = DS.Store.create
  revision: 11
  adapter: App.Adapter.create
    namespace: App.storeRoute
