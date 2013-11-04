app = angular.module('VoteNow')

app.controller 'VotingCtrl', ($scope, gon, $http, $location) ->

  $scope.vote = (score, category_id) ->
    $http.post($location.path(), score: score, category_id: category_id)
