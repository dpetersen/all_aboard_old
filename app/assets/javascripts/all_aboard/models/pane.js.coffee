App.Pane = DS.Model.extend
  sourceData: DS.belongsTo("App.SourceData", embedded: true, key: "source_data")
  position: DS.attr("number")
  templateMarkup: DS.attr("string", key: "template_markup")

  markup: ( ->
    markup = @get("templateMarkup")
    context = @get("sourceData.dataObject")
    compiled = Handlebars.compile(markup)(context)
  ).property("sourceData", "templateMarkup").cacheable()
