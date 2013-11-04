app = angular.module('VoteNow')

app.controller 'VotingCtrl', ($scope, gon, $http, $location) ->

  $scope.categories = gon.categories

  $scope.score = (category_id) ->
    voting = _.find(gon.votings, category_id: category_id) || { score: null }
    voting.score

  $scope.vote = (score, category_id) ->
    $http.post($location.path(), score: score, category_id: category_id).success (new_voting) ->
      voting = _.find(gon.votings, category_id: category_id)
      if voting
        _.extend(voting, new_voting)
      else
        gon.votings.push(new_voting)
