feature 'Messages', js: true do
  let!(:sender) { create(:user) }
  let!(:first_receiver) { create(:user) }
  let!(:second_receiver) { create(:user) }

  before(:each) do
    login_as(sender, scope: :user)
    visit root_path
  end

  feature 'creating' do
    scenario 'shows successfull flash message' do
      fill_and_send_form
      expect(page).to have_content('Message sent!')
    end
  end

  private

  def fill_and_send_form
    click_on 'New message'
    fill_in 'message_title', with: 'Message title'
    fill_in 'message_content', with: 'Lorem Ipsum'
    select2(first_receiver.first_name, from: 'message_recipient_ids')

    click_on 'Send'
  end
end
