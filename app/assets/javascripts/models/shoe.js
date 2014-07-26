KicksMix.Models.Shoe = Backbone.Model.extend({
  urlRoot: "/api/shoes",
  comments: function() {
    this._comments = this._comments || new KicksMix.Collections.Comments([], { shoe: this });
    return this._comments
  },

  parse: function(response) {

    if (response.comments) {
      this.comments().set(response.comments, { parse: true });
    }

    return response;
  }
});