module ApplicationHelper
    
  def bootstrap_class_for(flash_type)
        case flash_type
        when 'success'
          'success'
        when 'error'
          'danger'
        when 'alert'
          'warning'
        when 'notice'
          'info'
        else
          flash_type.to_s
        end
    end

    def gravatar_for(user, options = { size: 200})
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      size = options[:size]
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
      image_tag(gravatar_url, alt: user.username, class: "img-circle")
    end
end