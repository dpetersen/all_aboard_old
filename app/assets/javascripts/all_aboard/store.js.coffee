DS.attr.transforms.readOnlyObject = {
  from: (object) ->
    object

  to: (deserialized) ->
    console.error "I don't know what happened, but I know it isn't good."
}

App.store = DS.Store.create
  revision: 4
  adapter: DS.RESTAdapter.create
    namespace: App.storeRoute
