App.PresentSlideView = Em.View.extend
  layoutName: Ember.computed ->
    "layouts/" + @get("content.layoutName")
  .property("content.layoutName")
