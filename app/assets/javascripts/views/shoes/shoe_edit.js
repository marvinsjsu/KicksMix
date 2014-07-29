KicksMix.Views.ShoeEdit = Backbone.CompositeView.extend({
  template: JST['shoes/edit'],
  tagName: 'li',
  className: 'shoes-edit',

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
   // var editor = new Pen("#pen-mode");
  },

  events: {
    "submit form": "editShoeDetails"
  },

  editShoeDetails: function(event) {
    event.preventDefault();
    event.stopPropagation();
    var shoe = this.model;
    var params = $(event.currentTarget).serializeJSON();

    shoe.save(params["shoe"], {
      success: function() {
        $("#edit-shoe-modal").modal("hide");
      }
    });


  },

  render: function () {
    var content = this.template({
      shoe: this.model
    });

    this.$el.html(content);
    return this;
  }
});