KicksMix.Collections.Likes = Backbone.Collection.extend({
  model: KicksMix.Models.Like,
  url: function() {
    return this.obj.url();
  }
});