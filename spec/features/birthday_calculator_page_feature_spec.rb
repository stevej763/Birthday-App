require 'capybara/rspec'

feature 'Birthday Page:' do
  before do
    visit('/')
  end
  
  scenario 'Has expected headings' do
    expect(page).to have_content 'Hello there!'
    expect(page).to have_content "What is your name?"
    expect(page).to have_content "When is your next birthday"
    expect(page).to have_field 'birthday-day'
    expect(page).to have_field 'birthday-month'
    expect(page).to have_button 'Go'
  end

  scenario 'Months dropdown contains all months and blank option' do
    months = ["--Please choose an option--", 
              "January", "February", "March", 
              "April", "May", "June", 
              "July", "August", "September", 
              "October", "November", "December"]

    expect(page).to have_select("birthday-month", options: months)
  end

  scenario 'basic feature test' do
    name = 'Steve Jones'
    page.fill_in('user_name', with: name)
    page.fill_in('birthday-day', with: 24)
    page.select('December', from: 'birthday-month')
    page.click_button('Go')
    expect(page).to have_current_path("/result")
    expect(page).to have_selector('#days-to-go', text: "It is only 80 days until your birthday!")
    expect(page).to have_selector('#user_name', text: name)
  end

end
