ActiveAdmin.register ChatService do
  permit_params :id, :service_id, :telegram_chat_id, :do_not_repeat
end
