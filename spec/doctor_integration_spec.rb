require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a doctor', {:type => :feature}) do
  it('Add a doctor from form input') do
    visit('/admin')
    fill_in('name', with: 'Dr. Brown')
    fill_in('specialty', with: 'Cardiology')
    click_button('Add Doctor')
    expect(page).to have_content('Dr. Brown')
  end
end
