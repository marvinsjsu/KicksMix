KicksMix.Collections.Mixes = Backbone.Collection.extend({
  model: KicksMix.Models.Mix,
  url: function() {
    return this.obj.url();
  }
});