KicksMix.Collections.Comments = Backbone.Collection.extend({
  model: KicksMix.Models.Comment,
  url: function() {
    return this.shoe.url() + "/comments";
  }
});
