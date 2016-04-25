class Client < ActiveRecord::Base
	has_and_belongs_to_many :contractors, class_name: 'Client', foreign_key:'contractor_id'
  belongs_to :contractor
  has_secure_password
  
end
