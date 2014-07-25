window.KicksMix = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new KicksMix.Routers.Router();
    Backbone.history.start();
  }
};


