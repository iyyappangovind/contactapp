class Contact < ActiveRecord::Base
	belongs_to :user

	validates :firstname, :lastname, presence: true
	validates :email, presence: true, uniqueness: true, format: { with: /(\w+)@(\w+\.\w+)/, on: :create }
	validates :mobile, presence: true, uniqueness: true, numericality: true, length: { is: 10 }
	
  def self.get_contact( id, current_user_id )
    Contact.where("id= ? AND user_id= ? OR id= ? AND contact_type= ?",id,current_user_id,id,'Public').first
  end

end
