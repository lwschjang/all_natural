allnatural = angular.module('allnatural',[
  'templates',
  'ngRoute',
  'controllers',
  'angular-flash.service',
  'angular-flash.flash-alert-directive'
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


allnatural.config([ '$routeProvider', 'flashProvider',
  ($routeProvider,flashProvider)->

    flashProvider.errorClassnames.push("alert-danger")
    flashProvider.warnClassnames.push("alert-warning")
    flashProvider.infoClassnames.push("alert-info")
    flashProvider.successClassnames.push("alert-success")
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'ProductsController'
        ).when('/products/new',
        templateUrl: "form.html"
        controller: 'ProductsController'
        ).when('/products/:productId',
        templateUrl: "show.html"
        controller: 'ProductsController'
        ).when('/products/:productId/edit',
        templateUrl: "form.html"
       controller: 'ProductsController'
      )
])

controllers = angular.module('controllers',[])
