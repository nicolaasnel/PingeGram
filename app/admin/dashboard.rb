ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Chats" do
          table do
            thead do
              tr do
                td content_tag(:strong, 'Name')
                td content_tag(:strong, 'Service')
                td content_tag(:strong, 'New Message Endpoint')
                td
              end
              current_user.telegram_chats.each do |chat|
                chat.chat_services.each do |chat_service|
                  tr do
                    td chat.name
                    td chat_service.service.name
                    td api_v1_chat_service_message_url(chat_service)
                    td do
                      link_to 'View', telegram_chat_path(chat), class: 'button'
                    end
                  end
                end
              end
              tr do
                td link_to 'New Chat', new_telegram_chat_path, class: 'button'
              end
            end
          end
        end
        panel "Messages" do
          table do
            thead do
              tr do
                td content_tag(:strong, 'Chat')
                td content_tag(:strong, 'Service')
                td content_tag(:strong, 'Date')
                td content_tag(:strong, 'Message')
                td
              end
              current_user.telegram_chats.each do |chat|
                chat.chat_services.each do |chat_service|
                  chat_service.messages.order(created_at: :desc).limit(10).each do |message|
                    tr do
                      td chat.name
                      td chat_service.service.name
                      td message.created_at
                      td message.text
                      td do
                        link_to 'View', message_path(message), class: 'button'
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end # content
end
