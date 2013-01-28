App.Pane = DS.Model.extend
  sourceData: DS.belongsTo("App.SourceData")
  position: DS.attr("number")
  compiledTemplatePath: DS.attr("string")
