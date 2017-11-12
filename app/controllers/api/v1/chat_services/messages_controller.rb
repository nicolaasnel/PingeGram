class Api::V1::ChatServices::MessagesController < Api::V1::BaseController
  before_action :assign_chat_service
  skip_before_filter :verify_authenticity_token, only: :create

  attr_accessor :chat_service

  def create
    publish
  end

  def show
    publish
  end

  private

    def publish
      Message.create(text: message, incoming: params.permit!.to_h, chat_service: chat_service)
      send_message
      head :no_content
    end

    def send_message
      Telegram.new.send(chat_service, message)
    end

    def message
      @_message = chat_service.service.message(params)
    end

    def assign_chat_service
      @chat_service = ChatService.find(create_params[:chat_service_id])
    end

    def create_params
      params.permit(:chat_service_id)
    end
end
