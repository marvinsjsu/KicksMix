KicksMix.Collections.Shoes = Backbone.Collection.extend({
  url: "/api/shoes",
  model: KicksMix.Models.Shoe,

  parse: function(response) {
    return response.shoes;
  },

  getOrFetch: function(id) {
    var shoe = this.get(id);
    var shoesCollection = this;
    if (shoe) {
      shoe.fetch();
    } else {
      shoe = new KicksMix.Models.Shoe({ id: id });
      shoe.fetch({
        success: function() {
          shoesCollection.add(shoe);
        }
      });
    }
    return shoe;
  }

});

KicksMix.Collections.shoes = new KicksMix.Collections.Shoes();
