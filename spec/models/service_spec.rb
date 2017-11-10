require 'rails_helper'

RSpec.describe Service, type: :model do
  it { should have_many(:chat_services) }
end
