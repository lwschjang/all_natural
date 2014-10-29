allnatural = angular.module('allnatural',[
  'templates',
  'ngRoute',
  'controllers',
])

allnatural.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'ProductsController'
      )
])

products = [
  {
    id: 1
    name: 'All-Purpose Spray'
  },
  {
    id: 2
    name: 'Windex',
  },
  {
    id: 3
    name: 'Dishwashing Soap',
  },
  {
    id: 4
    name: 'Mr. Clean',
  },
]
controllers = angular.module('controllers',[])
controllers.controller("ProductsController", [ '$scope', '$routeParams', '$location',
  ($scope,$routeParams,$location)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)

    if $routeParams.keywords
      keywords = $routeParams.keywords.toLowerCase()
      $scope.products = products.filter (product)-> product.name.toLowerCase().indexOf(keywords) != -1
    else
      $scope.products = []
])