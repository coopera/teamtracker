PullRequestView = Backbone.View.extend({
  template: HandlebarsTemplates['pull_requests/index'],
  collection: new PullRequestCollection(),
  initialize: function () {
    this.listenTo(this.collection, 'reset change add remove', this.render, this);
    this.collection.fetch();
    this.render();
  },
  render: function () {
    var data = this.collection.toJSON();
    this.$el.html(this.template({ pull_requests: data }));
    return this;
  }
});

var view = new PullRequestView({ el: $("#pull-requests") });
