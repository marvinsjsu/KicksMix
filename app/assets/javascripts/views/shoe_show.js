KicksMix.Views.ShoeShow = Backbone.View.extend({
  template: JST["shoes/show"],
  initialize: function() {
    this.listenTo(this.model, "add sync remove", this.render);
  },
  render: function() {
    var content = this.template({
      shoe: this.model
    });

    this.$el.html(content);
    return this;
  }
});