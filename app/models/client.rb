class Client < ActiveRecord::Base
	has_and_belongs_to_many :contractors, class_name: 'Client', foreign_key:'contractor_id'
	has_many :contractors, through: :networks
	has_many :requests, dependent: :destroy
	has_many :chores, dependent: :destroy
	has_many :networks, dependent: :destroy

  # belongs_to :contractor

  has_secure_password
  
end
