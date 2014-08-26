describe "resource", ->

  resource = null
  $httpBackend = null

  beforeEach module "angularDemo"

  beforeEach inject (_resource_, _$httpBackend_) ->
    resource = _resource_
    $httpBackend = _$httpBackend_

  afterEach ->
    $httpBackend.verifyNoOutstandingExpectation()
    $httpBackend.verifyNoOutstandingRequest()

  describe "$save", ->

    resInst = null

    beforeEach ->
      $httpBackend.when('POST', '/data/test').respond {x: "y", id: 1}
      $httpBackend.when('PUT', '/data/test/1').respond {x: "y", id: 1}
      testResource = resource "/data/test/:id", {id: "@id"}, ["id", "x"]
      resInst = new testResource {x: "y"}

    it "should use the POST method if no id is set", ->
      $httpBackend.expectPOST '/data/test'

      resInst.$save()

      $httpBackend.flush()

    it "should use the PUT method if id is set", ->
      $httpBackend.expectPUT '/data/test/1'
      resInst.id = 1

      resInst.$save()

      $httpBackend.flush()

    it "should send a clean copy of the instance to the server", ->
      $httpBackend.expectPOST '/data/test', {x: "y"}
      resInst.y = "z"

      resInst.$save()

      $httpBackend.flush()
      expect(resInst.y).toBe "z"