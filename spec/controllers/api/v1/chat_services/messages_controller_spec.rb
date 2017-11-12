require 'rails_helper'

RSpec.describe Api::V1::ChatServices::MessagesController, type: :controller do
  let(:pingdom) { create(:pingdom) }
  let(:chat)    { create(:telegram_chat, services: [pingdom]) }

  before do
    request.headers['Authorization'] = "Token token=#{chat.user_id}"
    request.headers['Accept']        = 'application/json'
  end

  describe "POST #create" do
    before do
      post :create, params: { chat_service_id: chat.chat_services.first.id }
    end

    it { expect(response).to have_http_status(:no_content) }
    it 'should send a message' do
      expect(Message.count).to eq(1)
    end
  end

  describe "GET #show" do
    before do
      get :show, params: { chat_service_id: chat.chat_services.first.id }
    end

    it { expect(response).to have_http_status(:no_content) }
    it 'should send a message' do
      expect(Message.count).to eq(1)
    end
  end

end
