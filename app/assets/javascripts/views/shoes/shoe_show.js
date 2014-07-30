KicksMix.Views.ShoeShow = Backbone.CompositeView.extend({
  className: 'clearfix',

  template: JST["shoes/show"],

  initialize: function() {
    this.collection = this.model.comments();
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.collection, 'add', this.addComment);
    this.listenTo(this.model.likedBy(), 'add', this.render);
    this.listenTo(this.model.matchingItems(), 'add', this.renderMatchingItems);
   // this.listenTo(this.model.matchingItems(), 'add', this.renderMatchingItems);
   // this.listenTo(this.model.matchingItems(), 'add', this.addMatchingItems);

    var commentCollection = this.model.comments();
    var commentsTree = {};

    commentCollection.each(function(comment) {
      commentsTree[comment.parent_id] = commentsTree[comment.parent_id] || [];
      commentsTree[comment.parent_id].push(comment);
    });


    this.topLevelComments = commentsTree[undefined];
  },

  addComment: function(comment) {
    var view = new KicksMix.Views.CommentShow({
      model: comment
    });

    this.addSubview('#comments', view);
  },

  addLikedBy: function(like) {

    var view = new KicksMix.Views.ShoeLikedBy({
      model: like
    });

    this.addSubview("#likes-by-section", view);
  },

  addMatchingItems: function(matchingItem) {
    var view = new KicksMix.Views.ShoeMatchingItem({
      model: matchingItem
    });

    this.addSubview("#mix-n-match-section", view);
  },

  render: function() {
    var content = this.template({
      shoe: this.model,
      //comments: this.topLevelComments,
      template: this.template,
    });

    this.$el.html(content);
    this.renderComments();
    this.renderCommentForm();
    this.renderShoeEditForm();
    this.renderLikeButton();
    this.renderLikesBy();
    this.renderMatchingItemButton();
    this.renderMatchingItems();
    return this;
  },

  renderComments: function() {
    this.model.comments().each(this.addComment.bind(this));
  },

  renderCommentForm: function() {
    var view = new KicksMix.Views.CommentForm({
      model: this.model,
      collection: this.collection
    });

    //this.addSubview('#comment-form', view);
    this.addSubview('#shoe-navigation', view);
  },

  renderShoeEditForm: function() {
    var view = new KicksMix.Views.ShoeEdit({
      model: this.model
    });
    this.addSubview("#shoe-navigation", view);
  },

  renderLikeButton: function() {

    var view = new KicksMix.Views.ShoeLikeButton({
      model: this.model
    });
    this.addSubview("#shoe-navigation", view);
  },

  renderLikesBy: function() {

    this.model.likedBy().each(this.addLikedBy.bind(this));
  },

  renderMatchingItemButton: function() {
    var view = new KicksMix.Views.ShoeMatchButton({
      model: this.model
    });
    this.addSubview("#shoe-navigation", view);
  },

  renderMatchingItems: function() {
    this.$("#mix-n-match-section").html("");
    this.model.matchingItems().each(this.addMatchingItems.bind(this));
  }
});

















