##Fighting Coffee
#compileFunction = (slide, options) ->
#  paneNumber = parseInt(options.hash.position)
#  pane = slide.get("panes").findProperty("position", paneNumber)

#  if pane
#    markup = App.AllAboardTemplates[pane.get("compiledTemplatePath")]
#    context = pane.get("sourceData.dataObject")
#    new Handlebars.SafeString(Handlebars.compile(markup)(context))

## TODO this has to be bound or it won't update when the data updates!
## registerBoundHelper is throwing an error no matter what path I try and pass
## it.
#Em.Handlebars.registerBoundHelper("renderPaneFor", compileFunction, "layoutName")

# To hack around some registerBoundHelper problems I'm having.
# http://techblog.fundinggates.com/blog/2012/08/ember-handlebars-helpers-bound-and-unbound/
App.registerViewHelper = (name, view) ->
  Ember.Handlebars.registerHelper(name, (property, options) ->
    options.hash.contentBinding = property
    Em.Handlebars.helpers.view.call(this, view, options)
  )

crazyInnerView = Em.View.extend
  template: Em.Handlebars.compile('{{view.formattedContent}}')

  formattedContent: Em.computed ->
    console.info "I am here"
    slide = @get("content")

    paneNumber = parseInt(@get("position"))
    pane = slide.get("panes").findProperty("position", paneNumber)
  
    if pane
      markup = App.AllAboardTemplates[pane.get("compiledTemplatePath")]
      context = pane.get("sourceData.dataObject")
      new Handlebars.SafeString(Handlebars.compile(markup)(context))
  .property("content.panes.@each.sourceData.dataObject")

App.registerViewHelper("renderPaneFor", crazyInnerView)
