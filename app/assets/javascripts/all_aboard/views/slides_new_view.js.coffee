App.SlidesNewView = Ember.View.extend
  potentialLayouts: Em.computed ->
    App.Layout.find()
