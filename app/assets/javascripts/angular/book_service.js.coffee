AngulaRails.factory "Book", ($http, $q)->
  self = {}


  self.getBooks = (scope)->
    $http([ method: "GET", url: scope.urls.books ])
      .success (response)->
        scope.books = response.books

  # updated: getBooks using Promise
  self.getBooksWithPromises = ()->
    deferred = $q.defer()
    $http([ method: "GET", url: "/books" ])
      .success (response)->
        deferred.resolve(response.books)

    deferred.promise



  self