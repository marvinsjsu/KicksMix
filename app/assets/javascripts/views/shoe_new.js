KicksMix.Views.ShoeNew = Backbone.View.extend({
  template: JST["shoes/new"],
  render: function() {
    var content = this.template({});

    this.$el.html(content);
    return this;
  },

  events: {
    "submit form#add-review" : "addReview"
  },

  addReview: function(event){
    alert("addReview");
    event.preventDefault();
    var view = this;
    var params = $(event.currentTarget).serializeJSON();
    var files = $('#shoe_photo').get(0).files;

    this.handle_files(files, params);
  },

  handle_files: function(files, params) {
    var file = files[0];
    var reader = new FileReader();
    reader.onload = function(e) {

      params["shoe"].shoe_photo = e.target.result;

      var shoe = new KicksMix.Models.Shoe(params["shoe"]);
      shoe.save({}, {
        success: function() {
          KicksMix.Collections.shoes.add(shoe);
          Backbone.history.navigate("shoes/" + shoe.get("id"), { trigger: true });
        }
      });
    }
    reader.readAsDataURL(file);
  }

});