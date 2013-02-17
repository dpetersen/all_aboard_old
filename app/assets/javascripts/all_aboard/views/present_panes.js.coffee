App.PresentPanesView = Em.CollectionView.extend
  tagName: "ol"
  classNames: [ "panes" ]
  itemViewClass: App.PresentPaneView
