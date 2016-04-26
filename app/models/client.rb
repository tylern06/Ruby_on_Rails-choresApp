class Client < ActiveRecord::Base
	has_many :requests
	has_many :contractors, class_name: 'Client', foreign_key:'contractor_id', :through => :requests
  has_many :contractors
  belongs_to :contractor
  has_secure_password
  
end
