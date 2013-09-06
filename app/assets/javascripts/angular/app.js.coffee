# define app
angular.module 'VoteNow', ['rails']

angular.element(document).ready ->
  angular.bootstrap(document, ['VoteNow'])
