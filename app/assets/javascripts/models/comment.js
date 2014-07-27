KicksMix.Models.Comment = Backbone.Model.extend({
  initialize: function(params) {
    this.urlRoot = "/api/"+params["model"]+"s/"+params["model_id"]+"/comments";
  }
});