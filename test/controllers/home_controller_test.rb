# Instead of an integration test,
# We can test the cell in isolation and write a smoke test for the controller
require "test_helper"

class IntegrationTest < ActionDispatch::IntegrationTest
  it do
    Thing::Create.(thing: {name: 'Trailblazer'})
    Thing::Create.(thing: {name: 'Rails'})
    visit '/'
    page.must_have_css '.columns .header a', 'Descendents'
    page.must_have_css '.columns.end .header a', 'Trailblazer'
  end
end
