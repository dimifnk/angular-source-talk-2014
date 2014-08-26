describe "addressesCtrl", ->

  addressesCtrl = null
  $timeout = null
  $scope = null
  addresses = null
  $httpBackend = null
  Addresses = null
  address1 = null
  address2 = null

  beforeEach module "angularDemo"

  beforeEach inject ($controller, _$timeout_, _$httpBackend_, _Addresses_) ->
    $timeout = _$timeout_
    $httpBackend = _$httpBackend_
    Addresses = _Addresses_
    address1 = new Addresses
        id: 1
        firstname: "Acton"
        lastname: "Drake"
        street: "598-5508 Nunc Road"
        city: "Delta"
        zipcode: "C5 1LO"
        country: "Costa Rica"
        group: "Amet LLP"
        email: "auctor.vitae.aliquet@felispurus.org"
    address2 = new Addresses
        id: 2,
        firstname: "Angela"
        lastname: "Holt"
        street: "P.O. Box 948, 5878 Donec Rd."
        city: "Armento"
        zipcode: "22347"
        country: "Uganda"
        group: "Eget Institute"
        email: "sed.dictum.eleifend@lacinia.edu"
    addresses = [address1, address2]
    $scope = {}
    addressesCtrl = $controller "addressesCtrl", {$scope: $scope, addresses: addresses}

  beforeEach ->
    $httpBackend.when("DELETE", "/data/addresses/2").respond {id: 2}
    $httpBackend.when("GET", "/data/addresses").respond [{id: 1, forename: "test"}]

  afterEach ->
    $httpBackend.verifyNoOutstandingExpectation()
    $httpBackend.verifyNoOutstandingRequest()

  describe "initialization", ->

    it "should query all Addresses and they should be put on the scope", ->
      expect($scope.addresses).toBe addresses