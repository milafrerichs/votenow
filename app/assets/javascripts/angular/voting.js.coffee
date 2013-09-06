app = angular.module('VoteNow')

app = angular.module('VoteNow')

app.controller 'VotingCtrl', ($scope, gon) ->

  $scope.categories = gon.categories

  $scope.vote = (vote) ->
    console.log vote: vote
