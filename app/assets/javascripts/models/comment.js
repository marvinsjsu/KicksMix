KicksMix.Models.Comment = Backbone.Model.extend({
  urlRoot: '/api/comments',

  // initialize: function(params) {
  //   this.urlRoot = "/api/"+params["model"]+"s/"+params["model_id"]+"/comments";
  // },

  comments : function() {
    this._comments = this._comments || new KicksMix.Collections.Comments([], { obj: this });
    return this._comments
  },

  parse : function(response) {
    if (response.comments) {
      this.comments().set(response.comments, { parse: true });
    }
    return response;
  }
});