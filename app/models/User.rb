class User <ActiveRecord::Base
  validates_presence_of :uid, :provider, :handle

  def self.create_with_omniauth(auth)
    create! do |user|
      user.handle = "@" + auth["info"]["nickname"]
      user.image = auth["extra"]["raw_info"]["profile_image_url"] 
      user.uid = auth["uid"]
      user.token = auth["credentials"]["token"] # We might not even need this
      user.provider = auth["provider"]
      user.uid = auth["uid"]
    end
  end
end