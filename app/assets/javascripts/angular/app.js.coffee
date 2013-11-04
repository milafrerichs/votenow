#= require_self
#= require_tree .

angular.module 'VoteNow', ['rails']

angular.element(document).ready ->
  angular.bootstrap(document, ['VoteNow'])