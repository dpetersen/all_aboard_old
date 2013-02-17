App.PresentSlidesView = Em.CollectionView.extend
  tagName: "ol"
  itemViewClass: App.PresentSlideView
  emptyView: Em.View.extend(templateName: "slides_missing")
