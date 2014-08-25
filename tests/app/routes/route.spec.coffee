describe "route", ->

  $route = null

  beforeEach module "angularDemo"

  beforeEach inject (_$route_) ->
    $route = _$route_

  describe "routes", ->

    xit "should contain / with controller:addressesCtrl templateUrl:/assets/views/addresses.html", ->
      expect($route.routes['/'].controller).toBe 'addressesCtrl'
      expect($route.routes['/'].templateUrl).toBe '/assets/views/addresses.html'


    xit "should contain /add with controller:editCtrl templateUrl:/assets/views/edit.html", ->
      expect($route.routes['/add'].controller).toBe 'editCtrl'
      expect($route.routes['/add'].templateUrl).toBe '/assets/views/edit.html'

    xit "should contain /edit:id with controller:editCtrl templateUrl:/assets/views/edit.html", ->
      expect($route.routes['/edit/:id'].controller).toBe 'editCtrl'
      expect($route.routes['/edit/:id'].templateUrl).toBe '/assets/views/edit.html'