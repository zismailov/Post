feature 'Filtering', js: true do
  let!(:first_user) { create(:user) }
  let!(:second_user) { create(:user) }
  let!(:third_user) { create(:user) }

  # We're sending 3 messages:
  # 1. First user to second
  # 2. First user to third
  # 3. Third user to first and second
  let!(:first_message) do
    create(:message, title: 'First message', sender: first_user)
  end
  let!(:second_message) do
    create(:message, title: 'Second message', sender: first_user)
  end
  let!(:third_message) do
    create(:message, title: 'Third message', sender: third_user)
  end

  before(:each) do
    create(:user_message, message: first_message, user: second_user)
    create(:user_message, message: second_message, user: third_user)
    create(:user_message, message: third_message, user: first_user)
    create(:user_message, message: third_message, user: second_user)

    sign_in second_user
    visit messages_inbox_path
  end

  feature 'by sender' do
    scenario 'first user' do
      select first_user.first_name, from: 'sender'
      click_on 'Filter'

      within '#messages' do
        expect(page).to have_content(first_user.first_name)
        expect(page).to have_content(first_message.title)
        expect(page).to_not have_content(third_message.title)
      end
    end

    scenario 'third user' do
      select third_user.first_name, from: 'sender'
      click_on 'Filter'

      within '#messages' do
        expect(page).to have_content(third_user.first_name)
        expect(page).to have_content(third_message.title)
        expect(page).to_not have_content(first_message.title)
      end
    end
  end

  feature 'by message' do
    scenario 'title' do
      fill_in 'query', with: third_message.title
      click_on 'Filter'

      within '#messages' do
        expect(page).to have_content(third_user.first_name)
        expect(page).to have_content(third_message.title)
      end
    end

    scenario 'content' do
      fill_in 'query', with: third_message.content.split.first
      click_on 'Filter'

      within '#messages' do
        expect(page).to have_content(third_user.first_name)
        expect(page).to have_content(third_message.title)
      end
    end
  end

  feature 'by sender and message' do
    scenario 'title to find required message' do
      select third_user.first_name, from: 'sender'
      fill_in 'query', with: third_message.title
      click_on 'Filter'

      within '#messages' do
        expect(page).to have_content(third_user.first_name)
        expect(page).to have_content(third_message.title)
      end
    end

    scenario 'title to ditch unrelated messages' do
      select third_user.first_name, from: 'sender'
      fill_in 'query', with: first_message.title
      click_on 'Filter'

      within '#messages' do
        expect(page).to_not have_content(third_user.first_name)
        expect(page).to_not have_content(third_message.title)
      end
    end

    scenario 'content to ditch unrelated messages' do
      select third_user.first_name, from: 'sender'
      fill_in 'query', with: first_message.content.split.first
      click_on 'Filter'

      within '#messages' do
        expect(page).to_not have_content(third_user.first_name)
        expect(page).to_not have_content(third_message.title)
      end
    end
  end
end
