# In app/models/user.rb    
class User < ApplicationRecord
	include Clearance::User
 has_many :authentications, dependent: :destroy

 include BCrypt

 def password
   @password ||= Password.new(encrypted_password)
 end

 def password=(new_password)
   @password = Password.create(new_password)
   self.encrypted_password = @password
 end

 def self.create_with_auth_and_hash(authentication, auth_hash)
   user = self.create!(
     name: auth_hash["name"],
     email: auth_hash["extra"]["raw_info"]["email"]
   )
   user.authentications << authentication
   return user
 end

 # grab fb_token to access Facebook for user data
 def fb_token
   x = self.authentications.find_by(provider: 'facebook')
   return x.token unless x.nil?
 end
end