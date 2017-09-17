module ConversationsHelper
    def recipients_options(chosen_recipient = nil)
        s = ''
        User.vendor.each do |user|
            if current_user != user
                s << "<option value='#{user.id}' data-img-src='#{gravatar_for(user, size: 100)}' #{'selected' if user == chosen_recipient}>#{user.name}</option>"
            end
        end
        s.html_safe
    end
end
