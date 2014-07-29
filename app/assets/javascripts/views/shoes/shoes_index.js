KicksMix.Views.ShoesIndex = Backbone.View.extend({
  template: JST['shoes/index'],

  className: 'shoes-index',

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function () {
    var content = this.template({
      shoes: this.collection
    });

    this.$el.html(content);
    return this;
  }
});