module ApplicationHelper
  def resource_name
    :person
  end
 
  def resource
    @resource ||= Person.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:person]
  end

  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=30"
    image_tag gravatar_url, alt: user.name, class: "gravatar"
  end
end
