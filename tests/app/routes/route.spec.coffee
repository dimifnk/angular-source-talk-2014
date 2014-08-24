describe "route", ->

  $route = null

  beforeEach module "angularDemo"

  beforeEach inject (_$route_) ->
    $route = _$route_

  describe "routes", ->

    it "should contain / with controller:addressesCtrl templateUrl:/assets/views/addresses.html", ->
      expect($route.routes['/'].controller).toBe 'addressesCtrl'
      expect($route.routes['/'].templateUrl).toBe '/assets/views/addresses.html'


    it "should contain /add with controller:editCtrl templateUrl:/assets/views/edit.html", ->
      expect($route.routes['/add'].controller).toBe 'editCtrl'
      expect($route.routes['/add'].templateUrl).toBe '/assets/views/edit.html'

    it "should contain /edit:id with controller:editCtrl templateUrl:/assets/views/edit.html", ->
      expect($route.routes['/edit/:id'].controller).toBe 'editCtrl'
      expect($route.routes['/edit/:id'].templateUrl).toBe '/assets/views/edit.html'