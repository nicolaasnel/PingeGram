ActiveAdmin.register TelegramChat do
  permit_params :user_id, :bot_token, :chat_id, :name, service_ids: []

  show do
    columns do
      column do
        default_main_content
      end
      column do
        panel 'Services' do
          table do
            thead do
              tr do
                td content_tag(:strong, 'Name')
                td content_tag(:strong, '')
                td
              end
              telegram_chat.services.each do |service|
                tr do
                  td service.name
                  td do
                    link_to 'View', service_path(service), class: 'button'
                  end
                end
              end
            end
          end
        end
      end
    end

  end

  form do |f|
    f.inputs do
      f.hidden_field :user_id, value: current_user.id
      f.input :bot_token
      f.input :chat_id
      f.input :name
      f.input :services, as: :check_boxes
    end
    f.actions
  end
end
