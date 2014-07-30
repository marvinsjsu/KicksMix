KicksMix.Views.ShoesIndex = Backbone.View.extend({
  template: JST["shoes/index"],
  initialize: function() {
    this.listenTo(this.collection, "add sync remove", this.render);
  },
  render: function() {
    var content = this.template({
      shoes: this.collection
    });

    this.$el.html(content);
    this.$('.Collage').collagePlus();
    return this;
  }
});