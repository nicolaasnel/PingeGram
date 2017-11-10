require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:telegram_chats) }
  it { should have_many(:chat_services).through(:telegram_chats) }
  it { should have_many(:services).through(:chat_services) }

  describe '#display_name' do
    let(:user) { create(:user) }

    context 'with a blank name' do
      before do
        user.first_name = ' '
        user.last_name  = ''
      end

      it { expect(user.display_name).to eq(user.email) }
    end

    context 'with a name present' do
      it { expect(user.display_name).to eq("#{user.first_name} #{user.last_name}") }
    end
  end
end
