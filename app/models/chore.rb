class Chore < ActiveRecord::Base
  belongs_to :client
  belongs_to :contractor
end
