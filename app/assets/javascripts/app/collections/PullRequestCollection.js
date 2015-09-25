PullRequestCollection = Backbone.Collection.extend({
  model: PullRequestModel,
  url: '/feed/pull_requests'
});
