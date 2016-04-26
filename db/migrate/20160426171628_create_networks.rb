class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.references :client, index: true
      t.references :contractor, index: true
      t.references :chores, index: true

      t.timestamps
    end
  end
end
