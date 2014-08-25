describe "capitalize", ->

  capitalize = null

  beforeEach module "angularDemo"

  beforeEach inject ($filter) ->
    capitalize = $filter "capitalize"

  xit "should conver first character to upper-case", ->
    expect(capitalize "test").toBe "Test"