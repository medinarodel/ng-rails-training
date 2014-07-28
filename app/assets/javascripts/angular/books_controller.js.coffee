AngulaRails.controller "BooksController", ($scope,$http)-> 
  $scope.getBooks = () ->
    # Book.getBooks($scope)
    Book.getBooksWithPromises().then (books) ->
      $scope.books = books

  $scope.save = () ->
    if $scope.book.id?
      $http({ method: "PUT", url: $scope.book.url, data: $scope.book })
        .success (response) ->
          $scope.book = {}
          $scope.getBooks()
    else
      $http({ method: "POST", url: $scope.urls.books, data: $scope.book })
        .success (response) ->
          $scope.book = {}
          $scope.getBooks()

  $scope.delete = (book) ->
    $http({ method: "DELETE", url: book.url })
      .success (response) ->
        $scope.getBooks()

  $scope.edit = (book) ->
    $scope.book =
      id: book.id
      title: book.title
      author: book.author
      url: book.url