App.PresentSlideView = Em.View.extend
  classNameBindings: [ "layoutId" ]
  templateName: "present_slide"
  layoutId: Em.computed ->
    @get("content.layout.id")
  .property("content.layout.id")
