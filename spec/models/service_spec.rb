require 'rails_helper'

RSpec.describe Service, type: :model do
  it { should have_many(:chat_services) }
  it { should have_many(:telegram_chats) }
  # it { should have_many(:users).through(:telegram_chats) }
end
