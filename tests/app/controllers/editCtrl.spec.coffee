describe "editCtrl", ->

  editCtrl = null
  $scope = null
  $httpBackend = null
  Addresses = null
  address = null
  $location = null

  beforeEach module "angularDemo"

  beforeEach inject ($controller, _$httpBackend_, _Addresses_, _$location_) ->
    $httpBackend = _$httpBackend_
    $location = _$location_
    Addresses = _Addresses_
    address = new Addresses
      id: 1
      firstname: "Acton"
      lastname: "Drake"
      street: "598-5508 Nunc Road"
      city: "Delta"
      zipcode: "C5 1LO"
      country: "Costa Rica"
      group: "Amet LLP"
      email: "auctor.vitae.aliquet@felispurus.org"
    $scope = {}
    editCtrl = $controller "editCtrl", {$scope: $scope, address: address, $location: $location}

  beforeEach ->
    $httpBackend.when("DELETE", "/data/addresses/1").respond {id: 1}
    $httpBackend.when("PUT", "/data/addresses/1").respond {id: 1}

  afterEach ->
    $httpBackend.verifyNoOutstandingExpectation()
    $httpBackend.verifyNoOutstandingRequest()

  describe "save()", ->

    it "should trigger a PUT request to /data/addresses/:id", ->
      $location.path("/edit/:id")
      $httpBackend.expectPUT "/data/addresses/1"

      $scope.save()


      $httpBackend.flush()
      expect($location.path()).toBe "/"

  describe "delete()", ->

    it "should trigger a get request to /data/addresses/:id", ->
      $location.path("/edit/:id")
      $httpBackend.expectDELETE "/data/addresses/1"

      $scope.delete()

      $httpBackend.flush()
      expect($location.path()).toBe "/"
