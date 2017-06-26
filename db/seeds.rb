3.times { FactoryGirl.create(:user) }
p '3 users created'

# Couple of messages for second users
first_message = FactoryGirl.create(:message, sender: User.first)
FactoryGirl.create(:user_message, message: first_message, user: User.second)
p 'First message created'

second_message = FactoryGirl.create(:message, sender: User.last)
FactoryGirl.create(:user_message, message: second_message, user: User.second)
p 'Second message created'

# One message for two recipients
third_message = FactoryGirl.create(:message, sender: User.second)
FactoryGirl.create(:user_message, message: third_message, user: User.first)
FactoryGirl.create(:user_message, message: third_message, user: User.last)
p 'Third message for first and last users created'
