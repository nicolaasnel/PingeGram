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
                td content_tag(:strong, 'Services')
                td
              end
              current_user.telegram_chats.each do |chat|
                tr do
                  td chat.name
                  td chat.services.count
                  td do
                    link_to 'View', telegram_chat_path(chat), class: 'button'
                  end
                end
              end
              tr do
                td link_to 'New Chat', new_telegram_chat_path, class: 'button'
              end
            end
          end
        end
      end
    end
  end # content
end
