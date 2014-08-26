describe "capitalize", ->

  capitalize = null

  beforeEach module "angularDemo"

  beforeEach inject ($filter) ->
    capitalize = $filter "capitalize"

  it "should convert first character to upper-case", ->
    expect(capitalize "test").toBe "Test"