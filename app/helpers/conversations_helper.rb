module ConversationsHelper
    def recipients_options(chosen_recipient = nil)
    s = ''
    User.all.each do |user|
    s << "<option value='#{user.id}' data-img-src='#{gravatar_for(user, size: 100)}' #{'selected' if user == chosen_recipient}>#{user.name}</option>"
  end
  s.html_safe
end
end