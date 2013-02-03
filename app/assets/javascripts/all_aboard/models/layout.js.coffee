App.Layout = DS.Model.extend
  name: DS.attr("string")
  paneCount: DS.attr("number")

App.Layout.FIXTURES = [
  {
    id: "quarters"
    name: "Quarters"
    paneCount: 4
  },
  {
    id: "two_up"
    name: "Two Up"
    paneCount: 2
  }
]
