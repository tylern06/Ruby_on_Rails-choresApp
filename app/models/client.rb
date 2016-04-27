class Client < ActiveRecord::Base
	has_and_belongs_to_many :contractors, class_name: 'Client', foreign_key:'contractor_id'
	has_many :contractors, through: :networks
	has_many :requests, dependent: :destroy
	has_many :chores, dependent: :destroy
	has_many :networks, dependent: :destroy

  # belongs_to :contractor
	has_secure_password
	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :name, :address, :city, :state, :presence => true

  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }
  
  validates :password, length: { minimum: 2 }
end
