FactoryBot.define do
  factory :telegram_chat do
    name { 'Test Telegram Chat' }
    bot_token { 'test_token' }
    chat_id { 'chat123' }
    user
  end
end
