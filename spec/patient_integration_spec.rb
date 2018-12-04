require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a patient', {:type => :feature}) do
  it('Add a patient from form input') do
    visit('/admin')
    fill_in('pat_name', with: 'Brooke')
    fill_in('birthdate', with: '1964-01-01')
    click_button('Add Patient')
    expect(page).to have_content('Brooke')
  end
end
