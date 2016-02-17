require 'spec_helper'

describe JsNamespaceRails, js: true do

  include Capybara::DSL

  before(:each) do
    visit '/users'
  end

  it 'visit users page will have contain current controller name and action name' do

    controller_name = find('body')['data-controller']

    action_name = find('body')['data-action']

    expect(controller_name).to eq('users')

    expect(action_name).to eq('index')

  end

  it 'action evaluate will works' do

    expect(page).to have_css('h1.title')

    expect(page).to have_content('user_list')

  end

  it 'common behavior of controller will be works' do

    expect(page).to have_content('common_action_works')

  end
end