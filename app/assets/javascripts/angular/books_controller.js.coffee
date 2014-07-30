AngulaRails.controller "BooksController", ($scope, Book)-> 
  $scope.getBooks = () ->
    $scope.books = Book.query()


  $scope.save = () ->
    if $scope.book.id?
      Book.update({ id: $scope.book.id }, $scope.book)
    else
      Book.save($scope.book)

    $scope.book = {}
    $scope.getBooks()


  $scope.edit = (book) ->
    $scope.book = Book.get({ id: book.id })


  $scope.delete = (book) ->
    # book.$delete()
    Book.delete({ id: book.id })
    $scope.getBooks()