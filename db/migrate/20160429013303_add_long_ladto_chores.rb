class AddLongLadtoChores < ActiveRecord::Migration
  def change
  	add_column(:chores, :latitude, :float)
  	add_column(:chores, :longitude, :float)
  end
end
