Em.Handlebars.registerBoundHelper("renderPaneFor", (slide, options) ->
  paneNumber = parseInt(options.hash.position)
  pane = slide.get("panes").findProperty("position", paneNumber)

  if pane
    console.info pane.get("sourceData").get("dataObject")
    "#{pane.get("sourceData.dataObject")} - #{pane.get("sourceData").get("id")}"
)
