class AddChoreReferenceToNetwork < ActiveRecord::Migration
  def change
  	add_reference(:networks, :chore, index: true)
  end
end
