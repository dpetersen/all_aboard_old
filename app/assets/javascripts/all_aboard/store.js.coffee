DS.RESTAdapter.registerTransform("readOnlyObject"
  fromData: (value) ->
    console.info "from data", value

  toData: (value) ->
    console.info "to data", value

#  from: (object) ->
#    object

#  to: (deserialized) ->
#    deserialized
)

App.Adapter = DS.RESTAdapter.extend()
App.Adapter.map("App.Board", slides: { embedded: "always" })
App.Adapter.map("App.Slide", panes: { embedded: "always" })

App.store = DS.Store.create
  revision: 11
  adapter: App.Adapter.create
    namespace: App.storeRoute
