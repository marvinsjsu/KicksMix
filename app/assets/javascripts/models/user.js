KicksMix.Models.User = Backbone.Model.extend({
  urlRoot : "/api/users",

  comments: function() {
    this._comments = this._comments || new KicksMix.Collections.Comments([], { obj: this });
    return this._comments;
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

    return response;
  }
});