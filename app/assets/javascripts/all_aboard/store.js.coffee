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

App.store = DS.Store.create
  revision: 11
  adapter: DS.RESTAdapter.create
    namespace: App.storeRoute
