App.PresentSlideView = Em.View.extend
  templateName: "present/slide"
  layoutName: Ember.computed ->
    "layouts/" + @get("content.layout.id")
  .property("content.layout.id")
