KicksMix.Models.User = Backbone.Model.extend({
  urlRoot : "/api/users",

  comments: function() {
    this._comments = this._comments || new KicksMix.Collections.Comments([], { obj: this });
    return this._comments;
  },

  liked_shoes: function() {
    this._liked_shoes = this._liked_shoes || new KicksMix.Collections.Shoes([], { obj: this });
    return this._liked_shoes;
  },

  my_comments: function() {
    this._my_comments = this._my_comments || new KicksMix.Collections.Comments([], { obj: this });
    return this._my_comments;
  },

  parse: function(response) {
    if (response.comments) {
      this.comments().set(response.comments, { parse: true });
    }
    if (response.my_comments) {
      this.my_comments().set(response.my_comments, { parse: true });
    }
    if (response.shoe_likes) {
      this.liked_shoes().set(response.shoe_likes, { parse: true });
    }

    return response;
  }
});