require 'rails_helper'

RSpec.describe TelegramChat, type: :model do
  it { should belongs_to(:user) }
  it { should have_many(:services).through(:chat_services) }
  it { should have_many(:chat_services) }
end
