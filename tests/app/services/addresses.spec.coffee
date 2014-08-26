describe "resource", ->

  Addresses = null
  $httpBackend = null

  beforeEach module "angularDemo"

  beforeEach inject (_Addresses_, _$httpBackend_) ->
    Addresses = _Addresses_
    $httpBackend = _$httpBackend_

  afterEach ->
    $httpBackend.verifyNoOutstandingExpectation()
    $httpBackend.verifyNoOutstandingRequest()

  beforeEach ->
    $httpBackend.when("GET", "/data/addresses").respond [{id: 1, forename: "test"}]
    $httpBackend.when("GET", "/data/addresses/1").respond {id: 1}
    $httpBackend.when("POST", "/data/addresses").respond {id: 1}
    $httpBackend.when("PUT", "/data/addresses/1").respond {id: 1}
    $httpBackend.when("DELETE", "/data/addresses/1").respond {id: 1}

  describe "query()", ->

    it "should trigger a get request to /data/addresses", ->
      $httpBackend.expectGET "/data/addresses"

      Addresses.query()

      $httpBackend.flush()

  describe "get(address)", ->

    it "should trigger a get request to /data/addresses/:id", ->
      $httpBackend.expectGET "/data/addresses/1"

      Addresses.get id: 1

      $httpBackend.flush()

  describe "save(address)", ->

    it "should trigger a POST request to /data/addresses, if no id is given", ->
      $httpBackend.expectPOST "/data/addresses"

      Addresses.save forename: "john"

      $httpBackend.flush()

    it "should trigger a PUT request to /data/addresses/:id, if an id is given", ->
      $httpBackend.expectPUT "/data/addresses/1"

      Addresses.save forename: "john", id: 1

      $httpBackend.flush()

    it "should send only fields listed in the schema of the resource", ->
      # TODO: implement

  describe "delete(address)", ->

    it "should trigger a get request to /data/addresses/:id", ->
      $httpBackend.expectDELETE "/data/addresses/1"

      Addresses.delete id: 1

      $httpBackend.flush()