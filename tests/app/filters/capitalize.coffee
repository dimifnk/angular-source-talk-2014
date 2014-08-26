describe "capitalize", ->

  capitalize = null

  beforeEach module "angularDemo"

  beforeEach inject ($filter) ->
    capitalize = $filter "capitalize"

  xit "should convert first character to upper-case", ->
    expect(capitalize "test").toBe "Test"