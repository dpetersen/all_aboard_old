DS.attr.transforms.readOnlyObject = {
  from: (object) ->
    object

  to: (deserialized) ->
    deserialized
}

App.store = DS.Store.create
  revision: 4
  adapter: DS.RESTAdapter.create
    namespace: App.storeRoute
