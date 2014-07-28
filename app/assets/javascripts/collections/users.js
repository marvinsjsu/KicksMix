KicksMix.Collections.Users = Backbone.Collection.extend({
  model: KicksMix.Models.User,
  url: function() {
    return this.obj.url();
  }
});
