require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it { should have_many(:telegram_chats) }
  it { should have_many(:chat_services).through(:telegram_chats) }
  it { should have_many(:services).through(:chat_services) }

  describe '#display_name' do
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

  describe '#full_name' do
    context 'with first_name and last_name' do
      it { expect(user.full_name).to eq("#{user.first_name} #{user.last_name}") }
    end

    context 'with first_name only' do
      before { user.last_name = nil }

      it { expect(user.full_name).to eq(user.first_name) }
    end

    context 'with last_name only' do
      before { user.first_name = nil }

      it { expect(user.full_name).to eq(user.last_name) }
    end

    context 'with no first_name or last_name' do
      before do
        user.first_name = nil
        user.last_name  = nil
      end

      it { expect(user.full_name).to be_blank }
    end
  end
end
