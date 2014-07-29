KicksMix.Models.Like = Backbone.Model.extend({
  initialize: function(options){

    if (options.id) {
      this.url = "/api/shoes/" + options.id + "/likes";
     } else if (options.obj.id){
      this.url = "/api/shoes/" + options.obj.id + "/likes";
     }
  }
});