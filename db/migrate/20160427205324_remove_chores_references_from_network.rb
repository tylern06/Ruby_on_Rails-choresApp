class RemoveChoresReferencesFromNetwork < ActiveRecord::Migration
  def change
  	remove_reference(:networks, :chores, index: true, foreign_key: true)
  end
end
