describe "editCtrl", ->

  editCtrl = null
  $scope = null

  beforeEach module "angularDemo"

  beforeEach inject ($controller) ->
    $scope = {}
    editCtrl = $controller "editCtrl", {$scope: $scope}

  describe "save()", ->
    # TODO: implement

  describe "delete()", ->
    # TODO: implement