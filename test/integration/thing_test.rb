require 'test_helper'

class ThingIntegrationTest < Trailblazer::Test::Integration
  it 'allows anonymous' do
    visit '/things/new'

    click_button 'Create Thing'
    page.must_have_css '.error'
  end

  it 'allows anonymous' do
    visit '/things/new'

    page.must_have_css "form #thing_name"
    page.wont_have_css "form #thing_name.readonly"
  end

  it 'has an invalid description' do
    res, op = Thing::Create.run(thing: {name: 'Rails', description: "hi"})

    res.must_equal false
    op.contract.errors.to_s.must_equal \
      "{:description=>[\"is too short (minimum is 4 characters)\"]}"
  end


end
