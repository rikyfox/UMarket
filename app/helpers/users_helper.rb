module UsersHelper

  # Returns the Gravatar for the given user.
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

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

