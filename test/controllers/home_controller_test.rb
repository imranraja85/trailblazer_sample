# Instead of an integration test,
# We can test the cell in isolation and write a smoke test for the controller
#
# A smoke test solves 2 things. it makes sure:
#   * the cell is included
#   * the cell is rendered

require "test_helper"

#class IntegrationTest < ActionDispatch::IntegrationTest
class IntegrationTest < Trailblazer::Test::Integration

  it do
    Thing::Create.(thing: {name: 'Rails'})

    visit '/'
    page.must_have_css '.header a', 'Rails'
  end

  #it do
  #  Thing::Create.(thing: {name: 'Trailblazer'})
  #  Thing::Create.(thing: {name: 'Rails'})
  #  visit '/'
  #  page.must_have_css '.columns .header a', 'Descendents'
  #  page.must_have_css '.columns.end .header a', 'Trailblazer'
  #end
end
