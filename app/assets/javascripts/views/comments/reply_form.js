KicksMix.Views.ReplyForm = Backbone.CompositeView.extend({
  template: JST["comments/reply"],

  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.comments(), "sync", this.render);
 //   this.listenTo(this.collection, 'add', this.addComment);

  },

  events: {
    'submit form' : 'replyToComment',
    'click .reply-to-comment' : 'getSetCommentId'
  },

  getSetCommentId: function(event) {
    var commentId = $(event.currentTarget).data("id");
    $("input#comment-reply").val(commentId);
  },

  replyToComment: function(event) {

    event.preventDefault();
    event.stopPropagation();
    var params = $(event.currentTarget).serializeJSON();

    var comment = new KicksMix.Models.Comment(params["comment"]);


    var that = this;
    comment.save({
         parent_id: this.model.id,
         model_id: this.model.id
       }, {
       success: function() {

         that.model.comments().add(comment);
       }
    });

    $("#reply-comment-modal-"+this.model.id).modal("hide");

  },


  addComment: function(comment) {
    var view = new KicksMix.Views.CommentShow({
      model: comment
    });

    this.addSubview('#comments', view);
  },

  render: function() {
    var content = this.template({
      comment: this.model
    });

    this.$el.html(content);
    this.renderComments();

    return this;
  },

  renderComments: function() {
    this.model.comments().each(this.addComment.bind(this));
  }
});