KicksMix.Routers.Router = Backbone.Router.extend({
  routes: {
    "" : "shoesIndex",
    "shoes/new" : "shoeNew",
    "shoes/:id" : "shoeShow",
    "shoes/:id/edit" : "shoeEdit"
  },
  initialize: function() {
    //KicksMix.Collections.shoes = new KicksMix.Collections.Shoes();
  },

  shoesIndex: function() {

    KicksMix.Collections.shoes.fetch();

    var indexView = new KicksMix.Views.ShoesIndex({
      collection: KicksMix.Collections.shoes
    });

    this._swapView(indexView);
  },

  shoeShow: function(id) {
    var shoe = KicksMix.Collections.shoes.getOrFetch(id);

    var showView = new KicksMix.Views.ShoeShow({
      model: shoe
    });

    this._swapView(showView);
  },

  shoeNew: function() {
    var newView = new KicksMix.Views.ShoeNew();
    this._swapView(newView);
  },

  shoeEdit: function() {

  },

  _swapView: function(newView) {
    this._currentView && this._currentView.remove();
    this._currentView = newView;
    $("#main").html(newView.render().$el);
  }

});