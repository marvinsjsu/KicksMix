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

  matchingItems: function() {
    this._matchingItems = this._matchingItems || new KicksMix.Collections.Mixes([], { obj: this });
    return this._matchingItems;
  },

  parse: function(response) {
    if (response.comments) {
      this.comments().set(response.comments, { parse: true });
    }
    if (response.liked_by) {
      this.likedBy().set(response.liked_by, { parse: true });
    }
    if (response.matching_items) {

      this.matchingItems().set(response.matching_items, { parse: true });
    }
    return response;
  }
});