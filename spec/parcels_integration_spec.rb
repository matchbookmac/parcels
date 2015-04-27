require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application

describe('The shipping cost path', {:type => :feature}) do
  it('will return the cost of shipping when the user enters dimensions, distance, weight, and speed') do
    visit('/')
    fill_in('height', :with => 2)
    fill_in('width', :with => 3)
    fill_in('length', :with => 7)
    fill_in('distance', :with => 20)
    fill_in('weight', :with => 20)
    fill_in('discount', :with => 'EPICODUS')
    find('#speed').find(:xpath, 'option[2]').select_option()
    find('#gift-wrap').find(:xpath, 'option[2]').select_option()
    click_button('Submit')
    expect(page).to have_content('It will cost $20.82 to ship your parcel')
  end
end
