KicksMix.Collections.Users = Backbone.Collection.extend({
  model: KicksMix.Models.User,
  url: function() {
    return this.obj.url();
  },

  getOrFetch: function(id) {
    var user = this.get(id);
    var userCollection = this;
    if (user) {
      user.fetch();
    } else {
      user = new KicksMix.Models.User({ id: id });
      user.fetch({
        success: function() {
          userCollection.add(user);
        }
      });
    }
    return user;
  }
});

KicksMix.Collections.users = new KicksMix.Collections.Users();