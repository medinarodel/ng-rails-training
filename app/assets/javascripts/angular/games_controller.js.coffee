AngulaRails.controller "GamesController", ($scope, $http)-> 
  $scope.init = () ->
    $scope.currentPage = 1
    $scope.getGames()

  $scope.getGames = () ->
    http = 
      method: "GET"
      url: "/games"
      params:
        page: $scope.currentPage

    $http(http)
      .success (response) ->
        $scope.games = response.games
        $scope.paging = response.meta
        $scope.createPages()

  $scope.setPage = (newPage) ->
    newPage = 1 if newPage < 1

    $scope.currentPage = newPage
    $scope.getGames()

  $scope.createPages = () ->
    $scope.pages = [1..$scope.paging.number_of_pages]