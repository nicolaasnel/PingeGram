require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:telegram_chats) }
  it { should have_many(:chat_services).through(:telegram_chats) }
  it { should have_many(:services).through(:chat_services) }
end
