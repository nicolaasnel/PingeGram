require 'rails_helper'

RSpec.describe ChatService, type: :model do
  it { should belong_to(:service) }
  it { should belong_to(:telegram_chat) }
end
