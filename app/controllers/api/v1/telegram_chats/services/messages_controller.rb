class Api::V1::TelegramChats::Services::MessagesController < Api::V1::BaseController
  before_action :authenticate_api, :assign_variables
  skip_before_filter :verify_authenticity_token, only: :create

  attr_accessor :chat, :service
  def create
    Telegram.new.send(chat, service.message(params))
    head :no_content
  end

  private

    def assign_variables
      assign_chat
      assign_service
    end

    def assign_chat
      @chat = TelegramChat.find(create_params[:telegram_chat_id])
    end

    def assign_service
      @service = Service.find(create_params[:service_id])
    end

    def create_params
      params.permit(:telegram_chat_id, :service_id)
    end
end
