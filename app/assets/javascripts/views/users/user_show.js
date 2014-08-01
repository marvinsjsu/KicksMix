KicksMix.Views.UserShow = Backbone.CompositeView.extend({
  className: 'clearfix',

  template: JST["users/show"],

  initialize: function() {
    this.collection = this.model.comments();
    this.listenTo(this.model, 'sync', this.render);
  },

  addMyShoes: function(shoe) {
    var view = new KicksMix.Views.MyShoesView({
      model: shoe
    });

    this.addSubview('#my-shoes', view);
  },

  addMyLikedShoes: function(shoe) {
    var view = new KicksMix.Views.MyLikedShoesView({
      model: shoe
    });

    this.addSubview('#my-liked-shoes', view);
  },

  render: function() {
    var content = this.template({
      user: this.model
    });

    this.$el.html(content);
    this.renderMyShoes();
    return this;
  },

  renderMyLikedShoes: function() {
    this.model.liked_shoes().each(this.addMyLikedShoes.bind(this));
  },

  renderMyShoes: function() {
    this.model.my_shoes().each(this.addMyShoes.bind(this));
  }
});

















