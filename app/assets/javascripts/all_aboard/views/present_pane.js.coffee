App.PresentPaneView = Em.View.extend
  templateName: "present_pane"
  classNameBindings: [ "isAssigned:assigned:unassigned" ]
  isAssigned: Em.computed ->
    @get("content.pane")
  .property("content.pane")
