class Network < ActiveRecord::Base
  belongs_to :client
  belongs_to :contractor, class_name:"Client"
  belongs_to :chores
end
