require 'rails_helper'

RSpec.describe Message, type: :model do
  it { should belong_to(:chat_service) }
  it { should have_one(:telegram_chat).through(:chat_service) }
  it { should have_one(:service).through(:chat_service) }
end
