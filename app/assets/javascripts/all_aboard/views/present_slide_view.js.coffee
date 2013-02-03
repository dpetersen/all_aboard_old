App.PresentSlideView = Em.View.extend
  templateName: "present/slide"
  layoutName: Ember.computed ->
    "layouts/" + @get("content.layoutName")
  .property("content.layoutName")
