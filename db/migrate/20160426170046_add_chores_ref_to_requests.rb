class AddChoresRefToRequests < ActiveRecord::Migration
  def change
  	add_reference(:requests, :chore, index:true)
  end
end
