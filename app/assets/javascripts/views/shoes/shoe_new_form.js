KicksMix.Views.ShoeNewForm = Backbone.CompositeView.extend({
  template: JST['shoes/newform'],
  tagName: 'li',
  className: 'shoes-like',

  events: {
    "click .like-button": "addLike"
  },

  addLike: function(event) {
    event.preventDefault();
    var shoe = this.model;
    var user = JSON.parse($("#bootstrapped_current_user_json").html());

    var like = new KicksMix.Models.Like({ obj: this.model });

    like.save({
       shoe_id: shoe.id,
       user_id: user.current_user.id,
       photo_url: user.current_user.photo_url,
       description: user.current_user.description
      }, {
      success: function() {
        shoe.likedBy().add(like);
        $(".like-button").addClass("disabled");
      }
    });
  },

  render: function () {
    var content = this.template();

    this.$el.html(content);
    return this;
  }
});