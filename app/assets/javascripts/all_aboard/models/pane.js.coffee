App.Pane = DS.Model.extend
  sourceData: DS.belongsTo("App.SourceData", embedded: true, key: "source_data")
  position: DS.attr("number")
