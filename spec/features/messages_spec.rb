feature 'Messages', js: true do
  let!(:sender) { create(:user) }
  let!(:first_receiver) { create(:user) }
  let!(:second_receiver) { create(:user) }
  let!(:non_receiver) { create(:user) }

  feature 'creating' do
    before(:each) do
      login_as(sender, scope: :user)
      visit root_path
    end

    scenario 'shows successfull flash message' do
      fill_and_send_form
      expect(page).to have_content('Message sent!')
    end
  end

  feature 'viewing' do
    it 'is available for first recipient' do
      sign_in sender
      visit root_path
      fill_and_send_form
      sign_out sender

      sign_in first_receiver
      visit root_path

      expect(page).to have_content('Message title')
      expect(page).to have_content('Lorem Ipsum')
    end

    it 'is available for second recipient' do
      sign_in sender
      visit root_path
      fill_and_send_form
      sign_out sender

      sign_in second_receiver
      visit root_path

      expect(page).to have_content('Message title')
      expect(page).to have_content('Lorem Ipsum')
    end

    it 'is not available for non_receiver' do
      sign_in sender
      visit root_path
      fill_and_send_form
      sign_out sender

      sign_in non_receiver
      visit root_path

      expect(page).to_not have_content('Message title')
      expect(page).to_not have_content('Lorem Ipsum')
    end
  end

  private

  def fill_and_send_form
    click_on 'New message'
    fill_in 'message_title', with: 'Message title'
    fill_in 'message_content', with: 'Lorem Ipsum'
    select2(first_receiver.first_name, from: 'message_recipient_ids')
    select2(second_receiver.first_name, from: 'message_recipient_ids')

    click_on 'Send'
  end
end
