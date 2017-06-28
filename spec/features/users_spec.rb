# frozen_string_literal: true

feature 'Users' do
  feature 'registration' do
    scenario 'failed if no first name provided' do
      visit new_user_registration_path

      fill_in 'Last name', with: 'Bill'
      fill_in 'Email', with: 'bill@gates.com'
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'

      click_button 'Sign up'

      expect(page).to have_content "First name can't be blank"
    end

    scenario 'failed if no last name provided' do
      visit new_user_registration_path

      fill_in 'First name', with: 'Gates'
      fill_in 'Email', with: 'bill@gates.com'
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'

      click_button 'Sign up'

      expect(page).to have_content "Last name can't be blank"
    end
  end
end
