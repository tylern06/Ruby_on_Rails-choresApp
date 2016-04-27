class Addlocationcolumntochoremodel < ActiveRecord::Migration
  def change
  	add_column :chores, :state, :string, after: :description
  	add_column :chores, :city, :string, after: :description
  	add_column :chores, :address, :string, after: :description
  end
end
