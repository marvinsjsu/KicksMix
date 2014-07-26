KicksMix.Collections.Authors = Backbone.Collection.extend({
  model: KicksMix.Models.Author,
  url: function() {
    return this.shoe.url() + "/comments";
  },

  initialize: function(model, options) {
    this.shoe = options.shoe;
  }
});