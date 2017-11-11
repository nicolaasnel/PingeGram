require 'rails_helper'

RSpec.describe Api::V1::TelegramChats::Services::MessagesController, type: :controller do

  describe "POST #create" do
    let(:pingdom) { create(:pingdom) }
    let(:chat) { create(:telegram_chat, services: [pingdom]) }

    before do
      request.headers['Authorization'] = "Token token=#{chat.user_id}"
      request.headers['Accept']        = 'application/json'

      post :create, params: { telegram_chat_id: chat.id, service_id: pingdom.id }
    end

    it { expect(response).to have_http_status(:no_content) }
  end

end
