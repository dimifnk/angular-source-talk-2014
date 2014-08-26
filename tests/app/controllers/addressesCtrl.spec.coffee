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


  describe "$scope.reload()", ->
    it "should trigger a get request to /data/addresses", ->
      $httpBackend.expectGET "/data/addresses"

      $scope.reload()

      $httpBackend.flush()

  describe "$scope.reorder()", ->
    it "should set the order to col and reverseOrder should be the same", ->
      $scope.reverseOrder = false
      $scope.order = "lastname"
      col = "firstname"

      $scope.reorder col

      expect($scope.order).toBe col
      expect($scope.reverseOrder).toBe false

    it "should set the order to col and reverseOrder to the oposite of it", ->
      $scope.reverseOrder = false
      $scope.order = "lastname"
      col = "lastname"

      $scope.reorder col

      expect($scope.order).toBe col
      expect($scope.reverseOrder).toBe true

  describe "$scope.deleteSelected()", ->

    it "should delete all selected addresses", ->
      address2.selected = true
      $httpBackend.expectDELETE "/data/addresses/2"
      $httpBackend.expectGET "/data/addresses"

      $scope.deleteSelected()

      $httpBackend.flush()
      
  describe "$scope.selectAll()", ->

    xit "should add selection to all addresses, if $scope.allSelected is false", ->
      $scope.allSelected = false

      $scope.selectAll()

      expect(addresses.every (addr) -> addr.selected).toBe true

    xit "should deselect all addresses, if $scope.allSelected is true", ->
      $scope.allSelected = true

      $scope.selectAll()

      expect(addresses.some (addr) -> addr.selected).toBe false

  describe "$scope.updateAllSelected()", ->

    xit "should set $scope.allSelected to false, if no address is selected", ->
      addresses.forEach (addr) -> addr.selected = false

      $scope.updateAllSelected()

      $timeout.flush 0
      expect($scope.allSelected).toBe false

    xit "should set $scope.allSelected to false, if not all addresses are selected", ->
      addresses.forEach (addr) -> addr.selected = false
      addresses[0].selected = true

      $scope.updateAllSelected()

      $timeout.flush 0
      expect($scope.allSelected).toBe false

    xit "should set $scope.allSelected to true, if all addresses are selected", ->
      addresses.forEach (addr) -> addr.selected = true

      $scope.updateAllSelected()

      $timeout.flush 0
      expect($scope.allSelected).toBe true 