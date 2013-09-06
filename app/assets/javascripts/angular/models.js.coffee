app = angular.module 'VoteNow'

app.factory 'gon', ($window) ->
  $window.gon or {}

app.factory 'Category', (railsResourceFactory) ->
  railsResourceFactory({url: '/categories', name: 'category'});

app.factory 'Application', (railsResourceFactory) ->
  railsResourceFactory({url: '/applications', name: 'application'});
