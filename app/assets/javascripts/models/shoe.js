KicksMix.Models.Shoe = Backbone.Model.extend({
  urlRoot: "/api/shoes",

  comments: function() {
    this._comments = this._comments || new KicksMix.Collections.Comments([], { obj: this });
    return this._comments;
  },

  likedBy: function() {
    this._likedBy = this._likedBy || new KicksMix.Collections.Likes([], { obj: this });
    return this._likedBy;
  },

  parse: function(response) {
    if (response.comments) {
      this.comments().set(response.comments, { parse: true });
    }
    if (response.liked_by) {
      this.likedBy().set(response.liked_by, { parse: true });
    }
    return response;
  }
});