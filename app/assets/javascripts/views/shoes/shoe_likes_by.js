KicksMix.Views.ShoeLikedBy = Backbone.CompositeView.extend({
  template: JST['shoes/likeby'],
  tagName: 'div',
  className: 'col-xs-4',
  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    "click" : "showModalInfo"
  },

  showModalInfo: function() {
    alert("showModalInfo");
  },

  render: function () {
    var content = this.template({
      like: this.model
    });

    this.$el.html(content);
    return this;
  }
});