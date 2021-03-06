KicksMix.Routers.Router = Backbone.Router.extend({
  routes: {
    "" : "shoesIndex",
    "shoes/new" : "shoeNew",
    "shoes/:id" : "shoeShow",
    "shoes/:id/edit" : "shoeEdit",
    "users/:id" : "showUser"
  },
  initialize: function() {
    //KicksMix.Collections.shoes = new KicksMix.Collections.Shoes();
  },

  showUser: function(id) {

    var user = new KicksMix.Models.User({ id: id });
    user.fetch({
      success: function(event, response, options) {

      }
    });

    var showUser = new KicksMix.Views.UserShow({
      model: user
    });

    this._swapView(showUser);
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

  shoeEdit: function(id) {
    var shoe = KicksMix.Collections.shoes.getOrFetch(id);
    var editView = new KicksMix.Views.ShoeEdit({
      model: shoe
    });
    this._swapView(editView);
  },

  _swapView: function(newView) {
    this._currentView && this._currentView.remove();
    this._currentView = newView;
    $("#main").html(newView.render().$el);
  }

});