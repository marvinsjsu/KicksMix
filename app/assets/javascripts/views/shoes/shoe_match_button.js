KicksMix.Views.ShoeMatchButton = Backbone.CompositeView.extend({
  template: JST['mixes/mix'],
  tagName: 'li',
  className: 'shoes-mix',
  initialize: function() {
   // this.listenTo(this.model.matchingItems(), "add", this.render);
  },
  events: {
    "submit form#add-mix-form" : "addMatchingItem"
  },

  addMatchingItem: function(event) {
      event.preventDefault();
      var view = this;
      var params = $(event.currentTarget).serializeJSON();
      var files = $('#mix_photo').get(0).files;

      this.handle_files(files, params);
    },

    handle_files: function(files, params) {
      var file = files[0];
      var reader = new FileReader();
      var view = this;
      reader.onload = function(e) {

        var user = JSON.parse($("#bootstrapped_current_user_json").html());
        params["mixes"].mix_photo = e.target.result;
        params["mixes"].shoe_id = view.model.id;
        params["mixes"].user_id = user.current_user.id;

        var mix = new KicksMix.Models.Mix(params);
        mix.save({}, {
          success: function(model, response, option) {
            //alert(JSON.stringify(response));

            view.model.matchingItems().set(response.matching_items);

          }
        });

        $("#add-to-mix-modal").modal("hide");
      }
      reader.readAsDataURL(file);
    },

  render: function () {
    var content = this.template({});

    this.$el.html(content);
    return this;
  }
});