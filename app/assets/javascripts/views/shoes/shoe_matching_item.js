KicksMix.Views.ShoeMatchingItem = Backbone.CompositeView.extend({
  template: JST['mixes/matches'],
    tagName: 'div',
    className: 'col-xs-4',
    initialize: function() {
      this.listenTo(this.model, "sync", this.render);
    },

    render: function () {

      var content = this.template({
        matching_item: this.model
      });

      this.$el.html(content);
      return this;
    }
});