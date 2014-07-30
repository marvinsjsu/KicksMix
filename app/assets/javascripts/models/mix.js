KicksMix.Models.Mix = Backbone.Model.extend({
  initialize: function(options){

    if (this.get("shoe_id")) {
      this.url = "/api/shoes/" + this.get("shoe_id") + "/mixes";
    } else if (this.get("mixes")["shoe_id"]) {
      this.url = "/api/shoes/" + this.get("mixes")["shoe_id"] + "/mixes";
    }
  }
});