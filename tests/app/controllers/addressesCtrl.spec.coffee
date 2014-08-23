describe "resource", ->

  addressesCtrl = null
  $timeout = null
  $scope = null
  Addresses = null
  addresses = null

  beforeEach module "angularDemo"

  beforeEach inject ($controller, _$timeout_) ->
    $timeout = _$timeout_
    addresses = [{}, {}, {}]
    $scope = {}
    Addresses =
      query: jasmine.createSpy("query").and.returnValue addresses
    addressesCtrl = $controller "addressesCtrl", {$scope: $scope, Addresses: Addresses}

  afterEach ->
    $timeout.verifyNoPendingTasks()

  describe "initialization", ->

    it "should query all Addresses and they should be put on the scope", ->
      expect(Addresses.query).toHaveBeenCalled()
      expect($scope.addresses).toBe addresses

  describe "$scope.selectAll()", ->

    it "should add selection to all addresses, if $scope.allSelected is false", ->
      $scope.allSelected = false

      $scope.selectAll()

      expect(addresses.every (addr) -> addr.selected).toBe true

    it "should deselect all addresses, if $scope.allSelected is true", ->
      $scope.allSelected = true

      $scope.selectAll()

      expect(addresses.some (addr) -> addr.selected).toBe false

  describe "$scope.updateAllSelected()", ->

    it "should set $scope.allSelected to false, if no address is selected", ->
      addresses.forEach (addr) -> addr.selected = false

      $scope.updateAllSelected()

      $timeout.flush 0
      expect($scope.allSelected).toBe false

    it "should set $scope.allSelected to false, if not all addresses are selected", ->
      addresses.forEach (addr) -> addr.selected = false
      addresses[0].selected = true

      $scope.updateAllSelected()

      $timeout.flush 0
      expect($scope.allSelected).toBe false

    it "should set $scope.allSelected to true, if all addresses are selected", ->
      addresses.forEach (addr) -> addr.selected = true

      $scope.updateAllSelected()

      $timeout.flush 0
      expect($scope.allSelected).toBe true