class Chore < ActiveRecord::Base
  belongs_to :client
  belongs_to :contractor, class_name:"Client"
  belongs_to :request

  validates :title, :description, :rate, :start, :end, :presence => true
  # validate :future_event
  # validate :date_validation

  # private
  # def future_event
  # 	errors.add(:start, "can't be in the past") if start < Time.now
  # end 
  # def date_validation
  # 	errors.add(:end, "end date can't be before start date") if :end > :start
  # end
end

