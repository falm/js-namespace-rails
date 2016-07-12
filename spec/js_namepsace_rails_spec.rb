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

  it 'should passing params to users js action' do
    # puts page.driver.console_messages

    expect(page).to have_content('user_name:Neo')

    expect(page).to have_content('user_id:11')
  end

  it 'should triggle js execute method' do
    # save_and_open_page
    expect(page).to have_content('Show')
    click_link 'Show'
    expect(page).to have_content('show-user')

  end

  it 'should triggle js execute with params' do
    expect(page).to have_content('Show')
    click_link 'Show'
    expect(page).to have_content('May the force be with you')
  end
end
