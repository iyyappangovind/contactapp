class User < ActiveRecord::Base
  	has_many :contacts
  	
  	validates :username, :email, presence: true
    
    has_secure_password

end
